# Specsmith — Principles Core

> The load-bearing axioms behind every Specsmith skill, distilled from the Nate B. Jones knowledge base (an AI-educator wiki of 48 concepts / 270 source videos).
>
> **This file is the degradation fallback.** When the full knowledge base is linked (see [`KB-LINK.md`](KB-LINK.md)), skills read the cited `concepts/<slug>.md` pages directly for source-grounded depth. When it is absent, skills fall back to the axiom here. Either way the principle is **loaded as context and applied before advising** — never appended as a citation after the fact.
>
> Each axiom carries a **Use / Don't-use boundary** so a skill never recommends a pattern whose "don't use when" matches the user's situation, and a **Trace** to the KB so any claim can be followed to its source.

---

## How to read this

Specsmith is organized around one spine: the **four cumulative disciplines** (Axiom 1). Everything else is either a discipline (Axioms 5, 6, 7), the mindset that makes the disciplines pay off (Axioms 2, 3), the law that keeps them from over-engineering (Axiom 4), or the law that makes the result reusable (Axiom 8). The **Agent Species framework** (appendix) is Nate B. Jones's — from his Tobi Lütke video (`sources/YpPcDHc3e9U`) — which Specsmith adopts as its architecture layer.

---

## Axiom 1 — The four disciplines are cumulative; failures compound downward

**Principle.** Working with frontier models is a ladder of four disciplines, each built on the one below:
1. **Prompt Craft** — structuring a single request (instructions, examples, format). Table stakes.
2. **Context Engineering** — curating the whole information environment (system prompt, tools, memory), not one instruction.
3. **Intent Engineering** — encoding *what to want*: purpose, values, decision boundaries, trade-offs the agent must resolve alone.
4. **Specification Engineering** — a self-contained, internally consistent blueprint an agent can execute over a long horizon with no human in the loop.

A brilliant prompt sitting on a broken context layer still fails. **Diagnose and fix the lowest broken rung first.**

**Why it matters.** Most "the AI is bad at this" complaints are a discipline-2/3 problem dressed up as a discipline-1 problem. Naming the weakest rung is the highest-leverage first move.

**Use when:** always — this is the diagnostic spine Specsmith routes on.
**Don't use when:** never skip it, but don't *over-climb* — a one-shot task may only need rungs 1–2 (see Axiom 4).

**Trace:** `concepts/ai-career-skills`, `concepts/prompting-and-skill-design` · FWK-024, FWK-023.

---

## Axiom 2 — The bottleneck moved; manage throughput, don't write the lines

**Principle.** AI made *execution* cheap, so the scarce inputs are now **clarity, intent, taste, and domain knowledge**. Operate like an engineering manager: direct a team of agents (guardrails, endpoint, mission, definition-of-done) instead of hand-writing the output. Corollary: **you cannot spec or evaluate what you do not understand** — AI alone plateaus where your domain knowledge ends.

**Why it matters.** It relocates the work from "produce the artifact" to "specify and judge the artifact," which is exactly what the upper disciplines (Axiom 1) are for.

**Use when:** the user has real domain knowledge to encode, or is choosing what to delegate.
**Don't use when:** the user can't yet catch a subtle error in the domain — then the move is *build the human's expertise first*, not automate. Flag this honestly.

**Trace:** `concepts/ai-builder-mindset` · FWK-008 (engineering-manager model), MND-009 (bottleneck classification: execution / clarity / ambition / distribution / relationship), MND-001 (domain-knowledge prerequisite).

---

## Axiom 3 — The workflow is the unit; don't automate what you can't describe

**Principle.** The real unit of decision is not a task or a prompt — it's a **workflow**: its inputs, allowed actions, definition of "good," checks, escalation path, and owner. If the user cannot state those in plain English, *that description is the work to do first.* A broad ask ("automate my reporting") usually hides ~20 distinct workflows; split before building.

**Why it matters.** This is the gate that prevents engineering the wrong thing flawlessly. It also sizes the project honestly.

**Use when:** any request that sounds like a category ("handle my email," "do my research").
**Don't use when:** the workflow is already crisply describable and singular — then proceed; don't manufacture ceremony.

**Trace:** `concepts/knowledge-work-delegation`, `concepts/practical-agent-adoption` · source `LIkYVsxMpS8` (workflow-is-the-unit; automate / build / buy / hire / wait).

---

## Axiom 4 — Simple scales well; climb the lowest rung that clears 10×

**Principle.** Capability ladders by cost and fragility: data-ops < classical ML < single LLM call < single agent < multi-agent. Pick the **lowest rung that captures 90%+ of the value** and clears a 10× bar over the manual alternative. Past ~45% single-agent task accuracy, adding agents often produces flat or **negative** returns. Prefer dumb, narrow, single-purpose agents over one super-agent; prefer a two-tier planner→worker→judge hierarchy over flat agent teams.

**Why it matters.** Over-engineering is the default failure of sophisticated people. This axiom is the brake. (It is also why Specsmith itself is a set of small skills routed by a planner, not one mega-agent.)

**Use when:** choosing an architecture, or whenever a design starts sprouting agents.
**Don't use when:** genuine high volume + distinct specialized roles justify the coordination cost — then multi-agent earns its keep.

**Trace:** `concepts/practical-agent-adoption`, `concepts/multi-agent-system-design` · FWK-004 (simplest-rung / 10× rule), FWK-030 (six-level assistance spectrum), AGD-007 (coordination-overhead cliff), AGD-036 (dumb narrow agents), AGD-008 (two-tier beats flat).

---

## Axiom 5 — Context is assembled, not dumped; build the data room before the work

**Principle.** (Discipline 2 in practice.) Quality is driven by the *richness and curation* of the situation — constraints, success criteria, audience, tone, format — not by clever phrasing. So:
- **Build the data room first.** Make the agent assemble a bounded, reviewed local workspace (source inventory + conflict log + missing-context list) *before* it writes. Then the task prompt gets short. You cannot prompt away hallucination — there is no internal truth-check for an instruction to hook into; the structural fix is the reviewed source table.
- **Bundles, not nearest chunks.** An agent needs an assembled *operating bundle* (record + policy + entitlement + history), not the 3 most-similar chunks. Define the data **contract** first, then retrieval primitives.
- **Curated beats voluminous.** State what to **exclude**, not only what to include. Bigger context windows do not fix this — *"context rot."* More tokens ≠ the right assembled context.

**Why it matters.** Most RAG/agent failures are context-assembly failures, not model failures.

**Use when:** any task touching documents, data, or a corpus.
**Don't use when:** the task is genuinely self-contained and tiny — don't build a data room for a one-line rewrite.

**Trace:** `concepts/prompting-and-skill-design`, `concepts/rag-architecture-and-chunking`, `concepts/agent-memory-systems` · PRM-021 (depth over magic words), AGD-024 (curated context / memory-as-architecture), sources `ltbzgzZZmgI` (data-room-first), `lqiwQiDglGk` (bundles-not-chunks / context-rot).

---

## Axiom 6 — The meaning layer is the irreplaceable human job

**Principle.** (Discipline 4 in practice; "semantic engineering.") A spec is more than inputs/outputs. The human must supply what the agent **cannot infer from the task**: **invariants** (what must stay true), **hazards** (what must be actively prevented), **success criteria**, and the **unstated constraints** a domain expert never writes down because they're "obvious" — which are exactly what agents violate. Also: for any consequential action (refund, deploy, send), convey what *kind* of action it is, who owns it, whether it's reversible, and its blast radius.

**Why it matters.** This is the part AI can't do for you and the part that prevents the expensive failures. It's the heart of Specification Engineering.

**Use when:** anything an autonomous agent will execute, especially with real-world side effects.
**Don't use when:** never skip for consequential work; for trivial drafting, keep it light.

**Trace:** `concepts/semantic-engineering`, `concepts/agent-orchestration-architecture` · CAR-001 (define-the-meaning-layer), CRR-013 (four irreplaceable human responsibilities), AGD-052 (work-primitive semantics).

---

## Axiom 7 — Completion ≠ acceptance; the eval suite is the moat

**Principle.** When an agent is the executor, the unit of behavior is the **run**. "It reached a finish state" (completion) is not "a human trusts the result" (acceptance). Therefore:
- **Verify artifacts, not self-reports** — check the file written / row inserted / value present, never the agent's claim that it did the work.
- **Test the tail.** Aggregate accuracy hides the rare, high-stakes cases where the value actually lives (agents are strong on routine, weak exactly at atypical edges). If aggregate accuracy is ≥85% but tail accuracy is unknown, *you do not yet have an eval.*
- **Polish stopped meaning trust.** A model can look validated while a number is wrong in every cell. Put the strictest, independently-recomputed checks on the high-risk tier (numbers, money, compliance).
- Keep a small, durable **golden set** (input→ideal-output pairs) and **re-run it on every model release** instead of risking a blind production swap.

**Why it matters.** Evals are what separate a demo that wins on the routine case from a system that survives production traffic (which is mostly exceptions).

**Use when:** always, for anything that runs more than once or carries consequence.
**Don't use when:** never skip; scale the rigor to the risk tier.

**Trace:** `concepts/agent-evaluation-and-reliability`, `concepts/ai-quality-control` · AGD-045 (verify artifacts), AGD-016 (tail-of-distribution / inverted-U), AGD-028 (binary machine-verifiable done), DVH-008 (golden set + baseline), sources `n0nC1kmztSk` (completion≠acceptance / run-is-the-unit), `MFzxIT88zfg` (task-risk gradient / polish≠trust), `z3pbrFKVyQE` (re-run the janky private eval per model release).

---

## Axiom 8 — The reusable asset is the habit, not the prompt; own your memory

**Principle.** A static prompt string captures the instruction but loses the messy context, the revisions, and the "no, that's wrong for our case" corrections — which are the most transferable part. So the durable artifact bundles **task + context + interaction pattern + review step**, not a final answer. And keep that memory **portable and user-owned** (an "open brain"): memory architecture matters more than model choice, and platform-locked memory fragments your context and traps you. This is why Specsmith emits a **workflow bundle on disk**, not a chat dump, and why the knowledge base is a repo you own.

**Why it matters.** It's what makes the output shareable with a friend and re-runnable next quarter on a better model.

**Use when:** always, as the shape of the output.
**Don't use when:** never — even a throwaway task teaches a pattern worth capturing.

**Trace:** `concepts/open-brain-systems`, `concepts/ai-quality-control` · source `NRBQmwlILjk` (reusable-asset-is-the-habit), FWK-017 / FWK-041 (open-brain portable memory), FWK-003 (encode rejections as durable institutional rules).

---

## Appendix — The Agent Species framework (Nate B. Jones)

> **Attribution.** This taxonomy is **Nate B. Jones's**, laid out in his video *"Tobi Lütke Made a 20-Year-Old Codebase 53% Faster Overnight"* (`sources/YpPcDHc3e9U` — in the transcript he literally asks *"what are species, Nate?"*). It is captured in the KB at `concepts/agent-species.md` (ingested 2026-05-30) and in the source video/transcript — a `concepts/` grep now finds it (it had been a wiki gap, never evidence the framework is ours). Specsmith adopts it wholesale; cite the video, not Specsmith.

Every AI task maps to one of five architectures. Using the wrong one is a primary cause of agent failure.

| Species | What it is | Human sits | Succeeds when |
|---|---|---|---|
| **1a — Coding/Task Harness** | One agent stands in for a developer on a task; human is the quality gate | between each task | judgment is the gold standard; decompose well |
| **1b — Project Harness** | A planner agent coordinates short-running executors | at start & end | too complex for one mind; keep it two-tier (planner+executors), not three |
| **2 — Dark Factory** | Spec-to-output, no human in the middle | start (spec) & end (eval) | specs AND evals are both excellent |
| **3 — Auto-Research** | Agent hill-climbs a measurable metric | watches the metric | the problem is *metric-shaped*, not software-shaped |
| **4 — Orchestration** | Specialized agents hand off in sequence | at the joints | high volume + distinct roles justify coordination cost |

**Selection tree:** metric-shaped → 3 · else specialized roles + volume → 4 · else human can gate throughout → 1a (task) / 1b (too big for one mind) · else humans only at start/end → 2.

**Species-scoped constraints (for multi-species projects).** A constraint must declare its behavior per execution mode: **Enforce** (act: halt/pause/reject), **Measure-only** (record but don't act — mandatory for Auto-Research, which must complete its evaluation uninterrupted), or **Skip**. A Dark-Factory safety halt enforced inside an Auto-Research optimizer would permanently block it. Output a constraint × mode matrix; set the mode at init; never change it mid-run.

**Reversibility & operation taxonomy.** Tag every operation by type (read/write/approve/execute), reversibility (two-way door → agent may act; one-way door → draft/escalate), blast radius, and cost. High-blast-radius/irreversible/expensive operations get the tightest gates. (A Cursor agent erased a production DB *and its backups* in 9 seconds through one unguarded call — that's the cost of treating every operation the same.)

**Trace:** primary source `sources/YpPcDHc3e9U` (Nate B. Jones, the Tobi Lütke video). Related KB concepts: `concepts/agent-orchestration-architecture`, `concepts/multi-agent-system-design`, `concepts/agent-philosophy-and-mindset` · AGD-007, AGD-008, AGD-018, AGD-048/049, sources `adNErrz2aA0`, `n0nC1kmztSk`.
