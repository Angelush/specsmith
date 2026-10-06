# Eval protocol (no-API)

> Shared method for `design-evals`, `optimize`, and `audit-feedback-loop`. It reproduces the eval-design and hillclimbing logic described by Anthropic ("Automating eval design and hillclimbing", claude.dev blog, 2026-09-28) WITHOUT its tooling: no API key, no `/claude-api build-eval` or `hillclimb` runner, no pay-per-token billing. Everything runs inside the session you already have (e.g. Claude Code on a Pro/Max plan) or by hand. External reference, not part of the Nate B. Jones KB -- do not cite it as a KB entry.

## 1. Design checks (run on every golden set)

A good eval satisfies all four. Record each as PASS / FAIL / UNKNOWN in `evals/tests.md`.

1. **Mirrors production.** Cases sample the real usage distribution, not what is easy to write or grade.
2. **Scales with capability.** A stronger model or more thinking scores higher. If not, suspect ambiguous cases or a miscalibrated grader.
3. **Passable headroom.** The best configuration you can run scores well below 100%. A case that fails every run under every configuration is suspect -- check it before keeping it.
4. **Low run-to-run variance.** High variance means ambiguous cases, an inconsistent grader, or state leaking between runs.

**Sampling rule.** Pick hard cases because a human judged them hard, or because they failed in production (bug reports, tickets, rejected outputs). Never pick a case only because today's model fails it -- that samples the model's valleys, not the task.

**Source priority.** Real production transcripts (after a sensitivity review) > bug reports / tickets > 5-10 hand-written cases > synthetic cases. Tag each case with its `source`.

## 2. Golden set format

`evals/golden-set/cases.jsonl`, one case per line:

```json
{"id": "C01", "split": "train", "source": "ticket", "input": "...", "expected": "...", "criteria": ["AC1", "AC3"], "grader": "programmatic", "check": "output is valid JSON with field total == 412.50"}
```

- `split`: `train` or `test`. Assign at random, roughly 2:1. The optimizer may read `train` transcripts only; it never reads `test` content.
- `grader`: `programmatic` or `judge`. `check` states the exact rule (programmatic) or points to the rubric in `evals/grader.md` (judge).
- Every AC in `evals/acceptance.md` is covered by at least one case.

## 3. Grader rules

- **Cheapest grader that works.** Prefer programmatic checks: exact match, fixed label set, schema validation, tests pass, file exists, value recomputed. Use an LLM judge only for open-ended output.
- **Judge = rubric of checkable claims**, never a 1-5 scale. Each claim is yes/no ("cites the source row", "total matches recomputation"). A verdict (SHIP / REVISE / REJECT) is derived from the claims, not felt.
- **Judge != tested model.** Run the judge on a different model or a fresh context that has not seen the task agent's reasoning.
- **Blind comparison.** When comparing to a baseline, show both outputs in random order without labels.
- **Validate the grader before trusting it.** Grade 3-5 outputs, have the user confirm each verdict by hand, then grade the same output twice -- the verdicts must match. Fix the rubric until they do.

## 4. Running without the API

Pick the cheapest runner your environment has. None of them bills beyond your plan.

- **Subagents (Claude Code).** One fresh subagent per case, given only `production-prompt.md` + the case input (minimum-viable-context). Grade with a separate subagent on a different model, given only the output + `evals/grader.md`. Programmatic checks run as plain scripts.
- **By hand.** Paste each case into the target tool, save the output to `evals/runs/<run-id>/<case-id>.md`, grade against the rubric.

Log every run in `evals/runs/<run-id>/summary.md`: configuration (prompt version, model, effort), per-case pass/fail, split totals, and anything abnormal.

**Budget (plan quota is the real limit).** Defaults: Quick 5-10 cases x 1 run; Standard 10-20 cases x 2 runs; Deep 20-40 cases x 2-3 runs. State the expected run count before starting and stop when the user's budget is spent.

**Diagnostics after each run.** Flag cut-off, empty, or errored outputs separately -- never count them as fails or passes. If the baseline already passes ~95%+, stop optimizing quality and tell the user the remaining lever is cost/latency (cheaper model, lower effort, shorter prompt).

## 5. Noise floor

Run the baseline twice. `noise = |pass rate run 1 - pass rate run 2|` per split. A change counts as an improvement only if its gain exceeds the noise. If the smallest gain the user cares about is below the noise, add cases or runs before optimizing -- otherwise every result is a coin flip.

## 6. Hillclimbing loop (used by `optimize`)

1. **Goal.** The user states what to improve: pass rate, or cost/latency while holding pass rate.
2. **Split + noise floor** per sections 2 and 5.
3. **Each round:**
   - Read the failing `train` transcripts.
   - Propose ONE patch that targets a root cause, not surface wording. Rewordings too small for the eval to measure are not patches.
   - Re-run `train` and `test`.
   - **Keep** only if `train` AND `test` both improve beyond the noise. **Revert** if only `train` improves (overfitting) or either drops.
4. **Guards.**
   - Never paste failing-case content (inputs, expected answers) into the prompt.
   - Keep answers structurally out of reach of the task agent (no access to `cases.jsonl`, `expected`, or grader files).
   - Surfaces you may change: system/production prompt, skills or instruction files, tool descriptions, model and effort, harness code.
5. **Stall triage.** After 2-3 rounds without a kept patch, sort remaining `train` failures by root cause into: ambiguous case, grader bug, harness error, high variance, legitimate failure. Fix or drop the first four in the golden set / grader (log each change). Only legitimate failures continue.
6. **Report.** Best configuration by `test` score vs baseline, with the noise floor. If the gain is within noise, recommend NOT adopting it.
