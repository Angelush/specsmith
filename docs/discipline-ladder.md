# The Discipline Ladder: Specsmith's Core Framework

## The Cumulative Hierarchy
Professional prompting in the agentic era is a stack of four cumulative disciplines. Because these layers are sequential, failures compound downward: a flaw in Intent (Discipline 3) cannot be fixed by better Specification (Discipline 4). Use the "Lowest Broken Rung" rule: diagnose and stabilize the bottom-most failing discipline before ascending.

## The Four Disciplines

### 1. Prompt Craft (Tactical Execution)
The foundation of synchronous, session-based interaction. It focuses on structuring queries with clear instructions, examples, guardrails, and explicit output formats.
* Specsmith Skills: capture-habit, optimize.

### 2. Context Engineering (Environment Design)
The practice of curating the information environment. Rather than writing single instructions, you manage system prompts, tool definitions, and memory systems to ensure the agent has the correct "grounding."
* Specsmith Skills: build-context, classify-architecture.

### 3. Intent Engineering (Value Alignment)
Encoding organizational purposes, values, and decision boundaries. This involves defining the "why" and the "how" of decision-making so agents know what to want and how to handle trade-offs autonomously.
* Specsmith Skills: engineer-intent, author-constraints, simulate.

### 4. Specification Engineering (Architectural Blueprints)
The highest altitude of input. It requires the creation of structured, internally consistent documents (blueprints) that an agent can execute against over long horizons without human intervention.
* Specsmith Skills: engineer-spec, decompose-tasks, design-evals, red-team, audit-feedback-loop.

## Frontier Operations
Persistent skills required to remain at the edge of the model "capability bubble" as AI systems evolve.

* Boundary Sensing: Maintaining an up-to-date intuition of the human-agent boundary, recalibrating with every major model release.
* Seam Design: Architecting work so that handoffs between human and agent phases are clean, verifiable, and recoverable.
* Failure-Model Maintenance: Moving beyond generic skepticism to maintain a specific map of how current models fail (e.g., catching boilerplate but missing specific indemnification clauses).
* Capability Forecasting: Making sensible 6- to 12-month bets on which tasks will migrate "inside the bubble" to invest in the right skills.
* Leverage Calibration: Triaging human attention by deciding which outputs require deep review and which can be handled by automated test suites.

## Actionable Primitives
To effectively direct autonomous agents, implementations should adhere to these standards:

* Self-Contained Problem Statements: State problems so completely that the task is solvable without the agent needing to fetch additional context.
* Explicit Acceptance Criteria: Define exactly what "done" looks like with 3-5 verifiable sentences.
* Constraint Architecture: Define boundaries using four categories: Musts, Must-Nots, Preferences, and Escalation Triggers.
* Task Decomposition: Break complex projects into subtasks that take less than two hours to complete using reliable "break patterns."
* Evaluation Design: Build test cases with "known good" outputs to catch model regressions or "scheming" behaviors.

## Diagnostic Rule: The Lowest Broken Rung
The Specsmith 'orient' skill serves as the router for this ladder. It evaluates a request's current altitude and identifies the lowest broken rung. If the context is missing, the workflow drops to Discipline 2; if the intent is vague, it holds at Discipline 3. Progression to Specification (Discipline 4) is only permitted once the foundational rungs are verified and stable.
