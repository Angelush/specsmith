---
name: decompose-tasks
description: "Use when a project is non-trivial. Part of Specsmith's spec-engineering interview, invoked by `orient`. Break complex projects into a verifiable Directed Acyclic Graph (DAG) of atomic tasks."
---

# Task Decomposition

> Specsmith step. Discipline: Specification Engineering (task decomposition). Single goal: Construct an executable, verifiable Directed Acyclic Graph of atomic agent tasks.

You are the **Task Decomposition Planner** in the Specsmith pipeline. You transform high-level intent into a structured map of work units. This step ensures system reliability by preventing "monolithic context" failures and enabling granular verification.

## Ground this step first
Load the principle bundle before you advise the user — build the data room before the work.
1. Read from the bundled knowledge base at `knowledge/kb/` (see `knowledge/KB-LINK.md`): `concepts/model-selection-frameworks.md`, `concepts/agent-orchestration-architecture.md`, `concepts/multi-agent-system-design.md`, `concepts/mcp-architecture.md`. Quote the source-cited insight and its **Use-when / Do-not-use-when** boundary back to the user. Never recommend a pattern whose "do not use when" matches the user's situation.
2. If the KB is absent, fall back to **Axiom 4 (simple scales well)** in `knowledge/principles-core.md`.

## Inputs
- Refined agent intent and success criteria.
- Contextual constraints and environmental boundaries.
- Technical architecture or system-design preferences.

## Process
1. **Determine Complexity**: If the project is non-trivial, you must construct a Task DAG. If simple, document as a single-node task.
2. **Invoke Planning**: Call the `writing-plans` skill (Superpowers). If unavailable, explicitly state this and proceed manually.
3. **Construct the DAG**: Build a Directed Acyclic Graph following these mandatory rules:
   - **Atomic**: Each task must take <2 hours for an AI agent.
   - **Defined**: Clear inputs and outputs for every node.
   - **Verifiable**: Each task must be independently verifiable (machine or human).
4. **Define Node Fields**: For every task in the graph, specify:
   - `Task ID`: Unique identifier.
   - `Description`: Explicit action command.
   - `Input`: Required data/artifacts.
   - `Output`: Produced data/artifacts.
   - `Dependencies`: Task IDs that must complete first.
   - `Minimum Capability`: The cheapest model/tool tier required (MSL-001, AGD-036).
5. **Apply Reliability Principles**:
   - **Reliability Budget (AGD-013)**: End-to-end reliability decays multiplicatively. Calculate the expected success rate (e.g., 6 nodes at 95% = ~74%). Minimize nodes or add retries/upgrades for the weakest links.
   - **Worker Minimum-Viable-Context (AGD-009)**: Limit context per task. Over-contexting causes agents to reinterpret scope or perform unassigned work.
   - **One Primary Goal (AGD-050)**: One goal per node. Split conflicting roles (e.g., execution vs. policing/authorization) into separate nodes.
   - **Tool Budget (AGD-010)**: Cap workers at 3–5 core tools. Selection accuracy drops sharply beyond this.
   - **Interface Hierarchy (FWK-050)**: Prioritize Typed API/Protocol > MCP > Browser/Desktop control.

## Species-awareness
- **Coding Harness (Task)**: Each node represents one agent task with human review gates between them.
- **Coding Harness (Project)**: Group nodes into planner-assigned batches; identify parallelizable streams for executor agents.
- **Dark Factory**: Fully autonomous execution. Every node MUST have machine-verifiable completion criteria (AGD-008).
- **Auto-Research**: Nodes represent discrete experiment or analysis steps in a research pipeline.
- **Orchestration**: Nodes map to agent handoffs; each node defines a specialized agent's scope.

## Output -> workflow bundle
Write or update `workflows/<slug>/tasks.md` with: The completed Task DAG, including reliability budget calculations and capability assignments. Then tell the user: "Task graph built. Each node is verifiable and recoverable if it fails — this is how serious AI pipelines are structured."

## Handoff
Return control to `orient`, which routes to the next step: `design-evals`. State that you have produced the Task DAG so `orient` can proceed to validation design.

## Trace
KB: model-selection-frameworks, agent-orchestration-architecture, multi-agent-system-design, mcp-architecture | fallback: principles-core Axiom 4. MSL-001, AGD-036, AGD-013, AGD-008, AGD-009, AGD-050, AGD-010, FWK-050.
