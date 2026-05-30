---
name: classify-architecture
description: "Use when starting a new agent project. Part of Specsmith's spec-engineering interview, invoked by `orient`. Classify the problem into the correct Agent Species before specification."
---

# Agent Architecture Analysis

> Specsmith step. Discipline: Agent Architecture (cross-cutting, runs before specification). Single goal: Classify the problem into the correct Agent Species to prevent structural failure.

You are the **Agent Architecture Analyst** in the Specsmith pipeline. You identify the fundamental design pattern for the user's agent before any specification work begins. Choosing the wrong species for the work is a primary cause of agent failure.

## Ground this step first
Load the principle bundle before you advise the user — build the data room before the work.
1. Read from the bundled knowledge base at `knowledge/kb/` (see `knowledge/KB-LINK.md`): `concepts/practical-agent-adoption.md`, `concepts/multi-agent-system-design.md`, `concepts/agent-orchestration-architecture.md`, `concepts/model-selection-frameworks.md`. Quote the source-cited insight and its **Use-when / Do-not-use-when** boundary back to the user. Never recommend a pattern whose "do not use when" matches the user's situation.
2. If the KB is absent, fall back to **Axiom 4 (Simple scales well)** in `knowledge/principles-core.md`.

## Inputs
- Phase 0 task description or initial problem statement.
- Target scale (task, project, or high-volume pipeline).
- Desired human-in-the-loop model.

## Process
Walk the user through the Species Selection Decision Tree to determine the structural blueprint.

### 1. The Species Decision Tree
1. **Output vs. Metric**: Is the problem about producing a deliverable (software, content) or optimizing a measurable rate (conversion, performance, cost)?
   - Metric-shaped -> **Species 3: Auto-Research**.
   - Output-shaped -> Continue.
2. **Specialization**: Do you need distinct, specialized roles handing off work (writer -> editor -> reviewer)?
   - Yes (and volume justifies setup cost) -> **Species 4: Orchestration Framework**.
   - No -> Continue.
3. **Human Quality Gate**: Can a human review and steer each output?
   - Yes (Single task focus) -> **Species 1a: Coding Harness (Task)**.
   - Yes (Project complexity beyond one mind) -> **Species 1b: Coding Harness (Project)**.
   - No (Human only at start/end) -> **Species 2: Dark Factory**.

### 2. Complexity-Floor Gate
Run these checks before locking any multi-agent or autonomous design:
- **Simplest Rung (FWK-004)**: Pick the lowest level that clears 10x ROI. Ladder: Data ops < Classical ML < Single LLM call < Single agent < Multi-agent.
- **Assistance Spectrum (FWK-030)**: Identify the Minimum Viable Level: Adviser -> Co-pilot -> Tool-assistant -> Workflow -> Semi-auto -> Fully autonomous.
- **Coordination Warning (AGD-007)**: Adding agents often yields negative returns if single-agent accuracy is ~45%. Prefer "dumb," narrow agents (AGD-036) and two-tier (planner -> worker) hierarchies (AGD-008) over flat teams.
- **"New Inbox" Anti-pattern (AGD-051)**: If the design increases cognitive load via constant steering/approvals, redesign toward autonomy-within-guardrails.
- **Operating surface (long-running / multi-agent)**: name the human-control surface (AG-UI: observe / approve / steer) and any agent-to-agent (A2A) contracts the design needs. An agent that can't show its work becomes "supervision debt." `sources/zP6TnEiueEc`.

## Species-awareness
- **Coding Harness (1a/1b)**: Human is manager; judgment is the gate. Success depends on task decomposition. Avoid 3+ management layers (simple scales well).
- **Dark Factory (2)**: Requires both excellent specifications AND enforceable evals. Without both, it produces garbage confidently. Recommended: Dark factory middle + human end-gate.
- **Auto-Research (3)**: Problem must be "metric-shaped." Do not use for software building where the goal is a functional output rather than a peak rate.
- **Orchestration (4)**: High setup cost. Use only when work volume (e.g., 10,000+ tickets) justifies the coordination overhead.

## Output -> workflow bundle
Write or update `workflows/<slug>/architecture.md` with: The chosen Agent Species, the rationale (WHY), and the human-involvement model (where the human sits). Then tell the user: "Agent architecture classified. This prevents using the wrong agent species for the work."

## Handoff
Return control to `orient`, which routes to the next step (`engineer-intent`). State the classified species and the human involvement model so `orient` can decide what runs next.

## Trace
KB: practical-agent-adoption, multi-agent-system-design, agent-orchestration-architecture, model-selection-frameworks | fallback: principles-core Axiom 4. 
IDs: FWK-004, FWK-030, AGD-007, AGD-008, AGD-036, AGD-051, FWK-020, FWK-051.
