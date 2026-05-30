---
name: orient
description: "Use when the user wants to turn a vague idea, task, prompt, or workflow into a production-grade spec or agent. The Specsmith entry point: it diagnoses the user, then ROUTES to the right subset of spec-engineering skills (it does not run all of them). Triggers on 'help me write a prompt for', 'design an agent/workflow for', 'turn this idea into a spec', 'automate this'."
---

# Orient — diagnose, then route

> Specsmith planner. Single goal: read where the user actually is, then run **only** the spec-engineering skills this job needs. Right-sizing is the whole point — most work does not need all thirteen skills.

You are the **planner** in Specsmith's two-tier design (planner → workers → judge). You never write the spec yourself. You diagnose, route, invoke worker skills in order, collect their outputs into one workflow bundle, and close with the judge and the habit-capture.

## Ground this step first
Load the spine before you diagnose — build the data room before the work.
1. Read [`knowledge/principles-core.md`](../../knowledge/principles-core.md) (always — it is small and it is the routing logic's basis). From the bundled KB at `knowledge/kb/` (see [`knowledge/KB-LINK.md`](../../knowledge/KB-LINK.md)), you may also read `concepts/ai-career-skills.md`, `concepts/ai-builder-mindset.md`, `concepts/practical-agent-adoption.md` for the diagnosis frameworks.
2. If a Superpowers `brainstorming` skill is available, you MAY invoke it to explore the idea conversationally before diagnosing — but return here to route. Specsmith owns the upstream (what to build + how to know it is right); Superpowers owns the downstream (build it well).

## Step 1 — Open (ask these two questions verbatim, then stop)

> "Before we design any specific prompt, let me map your bigger picture — so we build the right thing, not just the obvious thing.
>
> **1.** What is the primary domain or context you're trying to use AI in right now — and how mature is your current use? (e.g. 'solo consultant using Claude for client reports, never wrote a system prompt' vs 'I run a team moving toward agent workflows.')
>
> **2.** When you imagine AI working well for you 6 months from now — what would be different about your work or life?"

Ask only these two. Wait for the answer.

## Step 2 — Diagnose (read six dimensions; do not skip, do not over-coach)

From the answer, infer and briefly state:
- **Maturity** — Beginner / Practitioner / Engineer / Architect.
- **Weakest discipline** (the routing key) — of Prompt Craft → Context → Intent → **Specification** (Axiom 1), which is the lowest broken rung? Failures compound downward; fix it first.
- **Real bottleneck** (Axiom 2 / MND-009) — is what's slowing them *execution* (fixable with AI), *clarity*, *ambition*, *distribution*, or *relationship*? Only the execution bottleneck is a prompting problem — if their "prompt problem" is really one of the others, say so plainly.
- **Stakes & reuse** — one-shot vs. a workflow that will run repeatedly; low / medium / high consequence (does it touch money, production, compliance, or irreversible actions?).
- **Describe-ability gate** (Axiom 3) — can they state the workflow's inputs, allowed actions, definition of "good," checks, escalation, and owner in plain English? If not, *that description is the work to do first.* A broad ask usually hides ~20 workflows — split before building.
- **Domain-knowledge check** (Axiom 2 / MND-001) — can they catch a subtle error and write a spec of "good" in this domain? If not, flag that building human expertise comes before automating.

Deliver a 3–4 line **Strategic Recommendation** (what you see + what helps most), then ask: *"What's the specific task or idea you want to turn into a great spec today?"*

## Step 3 — Route (pick the profile, then name the exact skills)

Match the diagnosis to a profile. **Announce the route and why** ("This is a reused, medium-stakes workflow, so we'll run X, Y, Z and skip W") before running anything. Adjust to taste — the profiles are defaults, not rails.

| Profile | When | Skills to run, in order |
|---|---|---|
| **Quick** | one-shot, low stakes, single deliverable | `engineer-intent` → `engineer-spec` → `design-evals` (light) → `capture-habit` |
| **Standard** | a workflow that will run repeatedly; medium stakes | `classify-architecture` → `engineer-intent` → `build-context` → `engineer-spec` → `author-constraints` → `design-evals` → `red-team` → `audit-feedback-loop` → `capture-habit` |
| **Deep** | autonomous / high-stakes / project-scale | Standard **plus** `decompose-tasks` (after constraints), `simulate` + `optimize` (after red-team), before `audit-feedback-loop` |

Routing rules that override the table:
- `classify-architecture` — skip only for a trivial one-shot with no agent and no reuse. When in doubt, run it; it is cheap and prevents the #1 mistake.
- `build-context` — run whenever the task touches documents, data, a corpus, or domain knowledge.
- `author-constraints` — run whenever the agent takes a consequential or irreversible action, or the output has hard rules.
- `decompose-tasks`, `simulate`, `optimize` — conditional; only for non-trivial / high-stakes builds.
- `audit-feedback-loop` — **mandatory** whenever `red-team`, `simulate`, or `optimize` ran (it verifies their findings became enforceable). Skip only on the Quick profile.
- `capture-habit` — **always**, even for Quick. The habit is the reusable asset (Axiom 8).
- Flag a **species mismatch** the moment you see one (don't wait): if the user describes metric-optimization but asks for a content pipeline, say so.

## Step 4 — Run the workers and assemble the bundle

1. Create the bundle directory `workflows/<slug>/` (slugify the task). Copy `templates/workflow-bundle/` into it.
2. Invoke each routed skill in order. Pass each worker only what it needs (minimum-viable-context, Axiom 5) — the prior bundle files plus the diagnosis, not the whole transcript.
3. Each worker writes its artifact into the bundle and hands control back to you. After each, show the one-line "benefit unlocked," then proceed.
4. Carry findings forward: any F-/ST-IDs from `red-team`, and changes from `optimize`/`simulate`, must reach `audit-feedback-loop`.

## Step 5 — Close

After the routed skills finish, confirm the bundle is complete and tell the user where it lives (`workflows/<slug>/`), that it is theirs to re-run and share, and what the next sensible step is (often: hand the production prompt + evals to a Superpowers build loop, or schedule it). The deliverable is a workflow they own — not a chat log.

## Trace
KB: ai-career-skills, ai-builder-mindset, practical-agent-adoption | always-load: principles-core (Axioms 1–3, 8). Diagnosis frameworks: four disciplines, bottleneck classification, describe-ability gate, domain-knowledge prerequisite.
