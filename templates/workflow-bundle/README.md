# Workflow: <name>

> A Specsmith **workflow bundle**. The durable, shareable asset is the *habit* — task + context + interaction pattern + review step — not a prompt string (Axiom 8). Clone this folder, re-run it, share it.

## The task
<one paragraph: what this workflow does and the outcome it produces>

## How to run it
1. Load `context.md` (the information environment).
2. Use `production-prompt.md` as the working prompt (tuned for the model named inside it).
3. Review every output against `evals/acceptance.md`.
4. Re-run `evals/golden-set/` whenever you change the prompt or switch models.

## The interaction pattern (the part that actually transfers)
<how you steer it: what to say, the corrections that matter, where you push back, what "no, that's wrong for our case" looks like here>

## The review gate
<who/what checks the output before it ships, and the one or two things most likely to be wrong>

## What's in this bundle
| File | What it is |
|------|------------|
| context.md | reusable context layer (Axiom 5) |
| architecture.md | Agent Species classification + human-involvement model |
| spec.md | self-contained specification + the meaning layer |
| constraints.md | MUST / MUST-NOT / PREFERENCE / ESCALATION + species-mode matrix |
| tasks.md | task DAG (only if decomposed) |
| production-prompt.md | the copy-paste working prompt |
| evals/ | acceptance criteria, A/B/C tests, golden set |
| failure-model.md | predicted failures + stress findings (F#/ST#) + mitigations |
| audit.md | proof every finding became an enforceable requirement |
| style-profile.md | the user's prompting style + improvement plan |
| .specsmith.json | provenance (skills run, KB version, model, date) |
