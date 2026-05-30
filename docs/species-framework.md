# Agent Species Framework

This document describes the Agent Species taxonomy from **Nate B. Jones**'s video *"Tobi Lütke Made a 20-Year-Old Codebase 53% Faster Overnight"* (`sources/YpPcDHc3e9U`) — in the transcript he coins the "species" framing directly. Specsmith adopts it to align agent architecture with task requirements. The framework is captured in the KB at `concepts/agent-species.md` (ingested 2026-05-30) and in the source video/transcript — cite the video or that page, not Specsmith.

## Species 1a: Coding Harness (Task-Scale)

*   **Definition:** A single LLM agent acting as a developer with tool access (read/write, search, execute). A human acts as the manager and quality gate.
*   **When to Use:** Optimizing for immediate, visible tasks where human judgment is the gold standard for quality.
*   **Key Insight:** Success depends entirely on decomposition. If you can break a task down, a single-threaded agent can execute it.
*   **Failure Mode:** Decomposition Collapse. Attempting to feed a broad, ambiguous goal to a task-scale harness leads to "hallucination loops" or shallow implementation.

## Species 1b: Coding Harness (Project-Scale)

*   **Definition:** A two-layer architecture where a 'Planner' agent coordinates multiple 'Executor' agents.
*   **When to Use:** Large-scale projects (millions of lines of code) with parallel workstreams too complex for one human/agent pairing.
*   **Key Insight:** Simple scales well. Avoid adding more than two layers of management; three layers historically fail in agentic workflows.
*   **Failure Mode:** Management Bloat. Adding unnecessary hierarchy increases latency and context fragmentation without improving output quality.

## Species 2: Dark Factory

*   **Definition:** A fully autonomous system where the "lights are off" during processing. Human involvement occurs only at the start (intent/spec) and end (eval review).
*   **When to Use:** Production pipelines where specs are precise and automated evals are trusted.
*   **Key Insight:** Requires both excellent specifications AND comprehensive evals. Without both, the factory produces "confident garbage" at scale.
*   **Failure Mode:** Silent Drift. Without a human-in-the-loop, the agent may pass technical tests (e.g., linting, unit tests) while completely missing the user's intent or non-functional requirements.

## Species 3: Auto-Research

*   **Definition:** An agent that optimizes against a specific, measurable metric through iterative experimentation (hill-climbing).
*   **When to Use:** Metric-shaped problems like runtime performance, conversion rates, or model tuning.
*   **Key Insight:** If you don't have a numerical metric, you aren't doing auto-research; you're doing a coding harness.
*   **Failure Mode:** Proxy Gaming. The agent optimizes for the metric provided but destroys the broader system's utility because the metric was a poor proxy for value.

## Species 4: Orchestration Framework

*   **Definition:** Multiple specialized agents with distinct roles (e.g., Writer, Editor, Reviewer) coordinated through formal handoffs.
*   **When to Use:** High-volume operations (10,000+ units) where the work requires specialized domain expertise at different stages.
*   **Key Insight:** The high setup and coordination cost is only justified by massive volume or extreme specialization requirements.
*   **Failure Mode:** Coordination Friction. The handoff between specialized agents often loses context, requiring heavy "context stitching" that makes the system slower than a generalist agent.

## Selection Decision Tree

1.  **Is the problem metric-shaped or output-shaped?**
    *   Metric-shaped -> **Species 3 (Auto-Research)**
    *   Output-shaped -> Proceed to 2
2.  **Do you need specialized roles with formal handoffs?**
    *   Yes, and volume is high -> **Species 4 (Orchestration)**
    *   No -> Proceed to 3
3.  **Can a human be the quality gate during execution?**
    *   Yes, task-scale -> **Species 1a (Task Harness)**
    *   Yes, project-scale -> **Species 1b (Project Harness)**
    *   No, humans only at start/end -> **Species 2 (Dark Factory)**

## Species-Scoped Constraint Enforcement

Constraints are enforced differently depending on the species and execution mode:

*   **Enforce:** The system stops execution if a constraint is violated (Default for Species 2).
*   **Measure-Only:** The system logs violations but continues, relying on human review (Default for Species 1a/1b).
*   **Skip:** Constraints are ignored for speed or during early exploration.

## Reversibility and Operation Taxonomy

Understanding the "door" type determines how cautiously a species should operate:

*   **Two-Way Doors (Reversible):** Low-cost changes, easy to undo. Species 1a/1b thrive here through rapid iteration.
*   **One-Way Doors (Irreversible):** High-cost, hard to undo (e.g., database migrations, public API changes). Species 2 and 4 require more rigid pre-flight constraints for these operations.

**Operation Taxonomy:**
*   **Read:** Discovery and context gathering.
*   **Write:** Code generation or documentation.
*   **Execute:** Running tests or scripts.
*   **Search:** Pattern matching and indexing.

## Anti-Patterns

*   **The Software Researcher:** Trying to use Auto-Research (Species 3) to build software features. Software is output-shaped, not metric-shaped.
*   **The Novelist Harness:** Using a single Coding Harness (Species 1a) to write a complex novel. Long-form creative work requires Orchestration (Species 4).
*   **The Blind Factory:** Running a Dark Factory (Species 2) without a comprehensive evaluation suite.
*   **Management Overhang:** Building 3+ layers of agents for a Project Harness (Species 1b). Simple scales better.
*   **Premature Orchestration:** Setting up complex CrewAI/LangGraph flows for tasks that a single Task Harness could solve in minutes.
