# Specsmith eval suite

Cases for `claude plugin eval` (Claude Code v2.1.269+). They check that the skills trigger on natural phrasing, that `orient` routes right, and that the eval skills apply `docs/eval-protocol.md`.

Runs use your Claude Code login, so they count against your plan's usage limits -- no API key. Each run is an isolated one-shot `claude -p` session: interactive steps are tested one message at a time.

| Case | Checks | Tags |
|---|---|---|
| orient/opens-with-diagnosis | asks the two questions, writes nothing yet | smoke |
| orient/routes-quick-for-one-shot | Quick route, no red-team/simulate/optimize | smoke |
| orient/routes-deep-for-high-stakes | Deep route incl. audit-feedback-loop | |
| orient/ignores-unrelated-request | orient does not fire on a coding question | smoke |
| design-evals/applies-eval-protocol | binary ACs, split cases.jsonl, claim rubric | needs Write |
| audit-feedback-loop/catches-gaps | flags unenforced F2 and within-noise R2 | needs Write + scaffold |
| optimize/rejects-gain-within-noise | keep/revert rule + noise floor | smoke |

## Budget (cheapest first)

Default is 3 runs per case per arm, plus a no-plugin arm: 7 cases = 42 agent runs. On a Pro plan, start small.

```bash
# smoke, one run, no baseline arm (4 runs)
claude plugin eval . --tag smoke --runs 1 --ablation none --no-publish

# one case while iterating
claude plugin eval . --case catches-gaps --runs 1 --ablation none --scaffold --allow-tools Write Edit

# full suite with the with/without-plugin comparison (heavy)
claude plugin eval . --scaffold --allow-tools Write Edit --threshold 0.8
```

`--scaffold` runs `audit-feedback-loop/catches-gaps/fixture.sh` (our own script). Cases that need Write fail without `--allow-tools Write Edit`.

Read `NOTES` for usage-limit errors before trusting a low score: a run that hit the plan limit scores 0. Results go to `evals/results/` (gitignored).
