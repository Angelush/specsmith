# Specsmith Architecture: Structure as Embodied Principle

The Specsmith architecture is a rejection of the "monolithic prompt" pattern. While earlier versions of the Prompt Architect cited engineering principles, they violated them in form—using a single, massive instruction set to solve every problem. Specsmith is designed so that its physical structure—the way files are organized, skills are scoped, and agents are routed—forces adherence to the Nate B. Jones knowledge base.

## The Diagnostic Spine: Routing over Repetition
**Principle:** The four disciplines (Prompt, Context, Intent, Spec) are cumulative; failures compound downward.
**Structural Decision:** The `orient` skill is the mandatory entry point. Instead of applying every discipline to every task, `orient` diagnoses the "lowest broken rung" and routes the user to a workflow that is right-sized for the problem:
- **Quick:** Rungs 1-2 (Prompt/Context). For low-stakes, high-frequency tasks.
- **Standard:** Rungs 1-3 (Intent). For complex delegation and agent-human handoffs.
- **Deep:** Rungs 1-4 (Specification). For autonomous systems and high-risk workflows.

## Modular Skill Architecture: Simple Scales Well
**Principle:** Simple scales well; prefer a two-tier hierarchy of narrow, single-purpose units.
**Structural Decision:** The monolith is split into 13 independent "skills" (e.g., `engineer-intent`, `decompose-tasks`, `design-evals`). Each skill has exactly one goal and one output file. This prevents "context rot" where an agent loses the user's intent in a sea of irrelevant instructions. Specsmith operates on a two-tier design:
1. **The Planner:** The primary agent (the user's CLI context) that understands the map.
2. **The Workers:** Specialized skills activated one at a time.
3. **The Judge:** The `audit-feedback-loop` skill that must validate worker output against the spec.

## Grounded Implementation: Data Room First
**Principle:** Context is assembled, not dumped; build the data room before the work.
**Structural Decision:** Every Specsmith skill is programmed to open with a "Grounding" phase. In previous iterations, principles were appended as trailing references. In Specsmith, the skill must read the relevant principles and user-provided context *before* offering advice. This "data-room-first" structure ensures that the agent's logic is derived from the sources, not from model hallucinations about "best practices."

## The Workflow Bundle: Habit as the Asset
**Principle:** The reusable asset is the habit, not the prompt.
**Structural Decision:** Specsmith does not produce a "final prompt" in a chat window. It produces a portable, on-disk workflow bundle (the `templates/workflow-bundle/` structure). This bundle includes the intent, the constraints, the tasks, and the evaluation suite. By forcing the output into a version-controlled directory, Specsmith ensures the "open brain" is portable across different models and teams.

## Verification: Completion != Acceptance
**Principle:** The eval suite is the moat; verify artifacts, not self-reports.
**Structural Decision:** In Specsmith, `design-evals` is not an optional "cleanup" step—it is a first-class citizen in the deep workflow. The structure requires the creation of a "Golden Set" (input/ideal-output pairs) before the production prompt is finalized. The `audit-feedback-loop` acts as a mandatory judge tier, checking that the implementation actually adheres to the hazards and invariants defined in the `constraints.md` and `spec.md` files.

## Open Brain: Ownership of Memory
**Principle:** Own your memory; platform-locked memory fragments your context.
**Structural Decision:** The Specsmith Knowledge Base (KB) is architected as a separate, optional linked repository.
- **Linked Mode:** If `KB-LINK.md` points to a local clone of the full wiki, skills read deep, source-grounded documentation.
- **Standalone Mode:** If the link is absent, skills fall back to `knowledge/principles-core.md`.
This allows users to maintain a private, evolving knowledge base that Specsmith uses without the data ever being trapped in a proprietary model's memory buffer.

## Ecosystem Composition: Superpowers vs. Specsmith
Specsmith is designed to compose with upstream "Superpowers" (like Greg Isenberg's or other high-level "what-to-build" frameworks).
- **Upstream (Superpowers):** Focuses on the "What" and the "Why" from a product/business perspective.
- **Downstream (Specsmith):** Takes those high-level intents and applies "Build-it-well" engineering rigor.
Specsmith transforms "I want to build a research bot" (Superpower intent) into a "Dark Factory" or "Orchestration" architecture with machine-verifiable definitions of done.
