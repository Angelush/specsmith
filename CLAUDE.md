# Specsmith — operating conventions

Specsmith is a **spec-engineering skill collection**: it turns a vague idea into a production-grade agent spec by walking the user up the four disciplines (Prompt Craft → Context → Intent → **Specification**), then emits a portable, ownable **workflow bundle**. It is not a prompt generator. It is the *upstream* half of building with AI — figuring out what to build and how to know it's right.

## How a session runs (two-tier: planner → workers → judge)

1. **Start with `orient`** (the planner). It asks two diagnostic questions, reads where the user actually is, then **routes** to the right subset of skills — Quick / Standard / Deep. Do **not** run all thirteen skills by default; right-sizing is the design (Axiom 4).
2. **Workers** each do one job and write one artifact into `workflows/<slug>/`. Each opens with **"Ground this step first"** — it loads the relevant knowledge bundle *before* advising (Axiom 5), then applies it.
3. **`audit-feedback-loop`** (the judge) is mandatory on Standard/Deep routes: it proves every red-team/optimize/simulate finding became an enforceable constraint, acceptance criterion, or task — not just a report line.
4. **`capture-habit`** always closes: it writes the bundle's habit README so the workflow can be re-run and shared (Axiom 8).

The deliverable is the bundle on disk, not the chat transcript.

## Grounding (the knowledge base is optional)

Every skill is grounded in the Nate B. Jones knowledge base, **bundled** at `knowledge/kb/` (concepts + source-video pages; see `knowledge/KB-LINK.md`). Point `$SPECSMITH_KB` at your own wiki to override it, or fall back to `knowledge/principles-core.md` (eight axioms) if `knowledge/kb/` is removed. Same principle, lower resolution. Never cite an entry ID you haven't confirmed exists (the verify recipe is in `KB-LINK.md`). The KB ships the curated wiki only — raw transcripts are intentionally excluded.

## Composition with Superpowers (don't reinvent it)

Specsmith owns the upstream; [Superpowers](https://github.com/obra/superpowers) owns the downstream. Hand off at the seams:

| When | Invoke (Superpowers) |
|---|---|
| Exploring the idea before diagnosing | `brainstorming` (from `orient`) |
| Building the task DAG | `writing-plans` (from `decompose-tasks`) |
| Turning the spec into code | `test-driven-development`, `subagent-driven-development` |
| Final verification before "done" | `verification-before-completion` (from `audit-feedback-loop`) |

If a Superpowers skill isn't installed, proceed and say so.

## The constraint library (cross-session memory)

Constraints authored in the **FWK-003 encode-rejection format** (WHAT WAS WRONG → WHY IT MATTERS → CONSTRAINT TO ADD → EXAMPLE) are durable institutional knowledge — the "open brain" (Axiom 8). Accumulate them across sessions: append reusable, domain-general rejections to a project-level `constraint-library.md` (or your memory system) so future sessions retrieve them instead of re-discovering. Keep it portable; own the layer.

## Conventions

- One skill = one job. If a skill grows a second goal, split it.
- Pass each worker only the bundle files + diagnosis it needs (minimum-viable-context), not the whole transcript.
- Preserve species-awareness in every skill — the Agent Species framework (`docs/species-framework.md`) shapes specs, constraints, evals, and simulation.
- Plain ASCII, imperative voice, tight files. These are working instructions, not essays.
