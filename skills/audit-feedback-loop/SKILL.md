---
name: audit-feedback-loop
description: "Use after any review step (red-team, simulate, optimize) and before closing a Specsmith session. The judge: verifies every finding became an enforceable constraint, acceptance criterion, or task — not just a line in a report. Mandatory gate for Standard and Deep routes."
---

# Audit the feedback loop (the judge)

> Specsmith judge — the third tier (planner → workers → **judge**). Single goal: prove that no finding from critique, failure analysis, stress testing, simulation, or optimization exists *only* in a report. Every one must be an enforceable, testable requirement in the bundle.

You are the **judge** in the Specsmith pipeline. Reports are where good findings go to die. Your job is to close the loop: each finding becomes a constraint, an acceptance criterion, a task spec, or a production-prompt rule — or it is a gap you fix now.

## Ground this step first
1. From the bundled KB at `knowledge/kb/`, read `concepts/ai-quality-control.md` and `concepts/agent-evaluation-and-reliability.md`. Otherwise fall back to **Axiom 7 (completion ≠ acceptance)** in `knowledge/principles-core.md`.
2. If a Superpowers `verification-before-completion` skill is available, invoke it before building the audit table.

## Inputs (the findings to audit)
- `failure-model.md` — every `F#` failure mode and `ST#` stress-test finding from `red-team`.
- `optimization-log.md` and `simulation.md` — any change or risk those steps surfaced.
- The enforcement surfaces to check against: `constraints.md` (M/N/P/E), `evals/acceptance.md` (AC#), `tasks.md`, and `production-prompt.md`.

## Process
1. **Enumerate every finding** with its ID. Pull them straight from the report files. Do not paraphrase away specifics.
2. **For each finding, locate its enforcement.** It must appear as at least one of:
   - a numbered constraint in `constraints.md` (a MUST / MUST-NOT / PREFERENCE / ESCALATION), or
   - a numbered acceptance criterion in `evals/acceptance.md`, or
   - a requirement in a `tasks.md` node, or
   - a rule in `production-prompt.md`.
3. **Resolve gaps immediately.** If a finding lives only in a report, convert it now using the **FWK-003 encode-rejection format**: WHAT WAS WRONG → WHY IT MATTERS → CONSTRAINT TO ADD → EXAMPLE OF CORRECT OUTPUT. Write the new constraint/AC/task into the right bundle file and give it an ID.
4. **Verify artifacts, not claims (AGD-045).** Confirm each referenced constraint/AC/task *actually exists* in the file — open it and check. Never accept "it's covered" without the line.

## Output → workflow bundle
Write `workflows/<slug>/audit.md` containing the audit table. Every row must read **INCLUDED** before the session closes:

```
| Finding ID | Description | Reflected in (file + ID) | Status |
|------------|-------------|---------------------------|--------|
| F3 | look-ahead bias risk | constraints.md M7; acceptance.md AC4 | INCLUDED |
| ST2 | flash-crash gap-fill | tasks.md T5 input rule | INCLUDED |
```

If any row is **GAP**, fix it and re-audit. Do not proceed to close with an open gap.

## Species-awareness
- **Dark Factory:** the bar is highest — there is no human mid-run, so every finding must map to a *machine-enforceable* check, not a human review note.
- **Orchestration:** verify handoff-failure findings became per-joint preconditions, not just end-to-end notes.
- **Coding Harness / Auto-Research:** confirm escalation-trigger and experiment-safety findings landed as actual constraints with the correct execution mode (enforce / measure-only / skip).

## Handoff
Return control to `orient` with the audit table. State "all findings INCLUDED" (or list remaining gaps). Only then may `orient` proceed to `capture-habit` and close.

## Trace
KB: ai-quality-control, agent-evaluation-and-reliability | fallback: principles-core Axiom 7. Method: FWK-003 encode-rejection, AGD-045 verify-artifacts, AGD-028 binary-done. Composes with Superpowers `verification-before-completion`.
