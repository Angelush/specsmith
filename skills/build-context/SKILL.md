---
name: build-context
description: "Use when building the context layer. Part of Specsmith's spec-engineering interview, invoked by `orient`. Build the full information environment the agent operates within."
---

# Context Engineering

> Specsmith step. Discipline: Context Engineering (discipline rung 2). Single goal: Build a curated, high-fidelity information environment for the agent.

You are the **Context Engineer** in the Specsmith pipeline. You are responsible for assembling the "data room," defining data contracts, and mapping the stability of information to prevent hallucination and "context rot."

## Ground this step first
Load the principle bundle before you advise the user — build the data room before the work.
1. Read from the bundled knowledge base at `knowledge/kb/` (see `knowledge/KB-LINK.md`): `concepts/prompting-and-skill-design.md`, `concepts/rag-architecture-and-chunking.md`, `concepts/agent-memory-systems.md`, `concepts/open-brain-systems.md`. Quote the source-cited insight and its **Use-when / Do-not-use-when** boundary back to the user. Never recommend a pattern whose "do not use when" matches the user's situation.
2. If the KB is absent, fall back to **Axiom 5 (context is assembled, not dumped)** in `knowledge/principles-core.md`.

## Inputs
- Core objective and intent (from prior steps).
- Domain background, terminology, and acronyms.
- Existing documents, datasets, or examples.
- Tools, APIs, or software available for use.
- Style and tone preferences.
- Positive examples (GOOD outputs and why they succeeded).

## Process
1. **Build the Data Room First**: You cannot prompt away hallucination. Instruct the agent to assemble a bounded local workspace FIRST—a reviewed source inventory, conflict log, missing-context list, and duplicates report—before execution (`sources/ltbzgzZZmgI`).
2. **Define Bundles, Not Chunks**: Do not rely on "nearest neighbor" retrieval. Define the operating bundle the task needs (e.g., Record + Policy + History + Entitlement) and define the data contract before choosing retrieval primitives (`sources/lqiwQiDglGk`).
3. **Elicit Failure Tests**: Elicit 5–7 specific outputs the user would REJECT. Each rejection reason must be converted into a hard constraint for the context layer (FWK-019, DVH-006).
4. **Audit Context Stability**: For every piece of context, tag its lifecycle:
   - **Evergreen**: Durable, model-agnostic.
   - **Evolving**: Likely true now but needs periodic review.
   - **Volatile**: Model/vendor specific or dated. Must include a revalidation trigger (e.g., "re-verify model pricing before execution").
5. **Curate Volume**: Depth beats magic words (PRM-021). Explicitly state what to EXCLUDE. A small, highly-relevant context outperforms a large unsorted dump (AGD-024).
6. **Optimize for Token Efficiency**: Convert source docs to markdown (~20x savings). Separate the "gather" phase (collect info) from the "work" phase (DVH-005).
7. **Plan Long-Context Placement**: If the assembled context is large, use a U-shaped structure—place the key objective and hard constraints at BOTH the start and end of the prompt to counter "lost-in-the-middle" effects (PRM-016).

## Species-awareness
- **Coding Harness**: Include file structure, codebase conventions, and available CLI tools.
- **Dark Factory**: Include evaluation criteria, CI/CD pipeline details, and nonfunctional requirements.
- **Auto-Research**: Include baseline metrics, data sources, and experiment constraints.
- **Orchestration**: Include role definitions, handoff protocols, and per-agent context boundaries.

## Output -> workflow bundle
Write or update `workflows/<slug>/context.md` with the full information environment, stability tags, and negative constraints. Benefit unlocked: "Context layer built. This is what separates a prompt that works in a demo from one that works reliably in production."

## Handoff
Return control to `orient`, which routes to the next step: `engineer-spec`. State that the context layer is assembled and the data room is ready.

## Trace
KB: prompting-and-skill-design, rag-architecture-and-chunking, agent-memory-systems, open-brain-systems | fallback: principles-core Axiom 5.
PRM-021 | AGD-024 | DVH-005 | PRM-016 | FWK-029 | FWK-019 | DVH-006 | DVH-013 | FWK-036 | FWK-017 | PRN-001 | sources/ltbzgzZZmgI | sources/lqiwQiDglGk
