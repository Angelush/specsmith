---
title: AI Infrastructure and Stack Evolution
type: concept
slug: ai-infrastructure-evolution
tags: [trend, infrastructure, agent-stack, orchestration, agent-readable, web-architecture]
sources: [7HP1jFJ9W1c, XlfumXPPrLY, BE4RclIGDmY, dQK_pTXrGDk, j5_wcDifNko, lqiwQiDglGk, z3pbrFKVyQE, zP6TnEiueEc]
stability: volatile
updated: 2026-05-29
---

# AI Infrastructure and Stack Evolution

The AI infrastructure stack is undergoing a profound evolution, shifting from human-centric tools to agent-first primitives. This development involves identifying and building missing components, particularly in orchestration, and adapting existing systems for an "agent-readable" web, as traditional human-paced affordances become bottlenecks for AI agents operating at significantly higher speeds.

## Why it matters

This evolution is crucial because agents are becoming primary interaction surfaces, with significant economic impact predicted, such as $1 trillion in B2C retail sales via AI agents by 2030. Businesses that fail to adapt their infrastructure to be "agent-readable and writable" risk invisibility, as AI agents will simply bypass ambiguous or human-optimized systems. The redesign of this infrastructure, from compute layers to orchestration, is analogous in scale to the shift to cloud computing or microservices.

## Key insights

-   **Agent infrastructure is moving to a 6-layer stack, shifting from human-first to agent-first primitives.** — This new stack includes Compute + sandboxing, Identity + communication, Memory + state, Tools + integrations, Provisioning + billing, and a critical, still-developing Orchestration + coordination layer. [[sources/7HP1jFJ9W1c]] (TRD-005)
-   **A major gap exists in agent orchestration and coordination infrastructure.** — This missing layer, analogous to what Kubernetes did for containers, requires agent-native scheduling, lifecycle management, merge/coordination for parallel work, supervision hierarchies, financial observability (FinOps), and standard failure/recovery patterns. [[sources/7HP1jFJ9W1c]] (TRD-005, TRD-006)
-   **The web is being rebuilt for machines, as human-centric design creates bottlenecks for agents.** — Traditional web affordances like slow UI loads, authentication flows, and pagination, designed for human perception, severely limit the productivity gains of AI agents operating 10-50x faster. This necessitates a full replacement of human scaffolding with agent-optimized primitives. [[sources/XlfumXPPrLY]] (TRD-043)
-   **Companies must become "agent-readable and writable" to participate in the emerging agentic economy.** — With AI agents mediating digital interactions and significant economic value flowing through them, businesses need clean, machine-readable data for product discovery, evaluation, and purchase to avoid being bypassed by agents. [[sources/BE4RclIGDmY]] (TRD-015)
-   **Existing enterprise systems, like CRMs, are evolving into agent infrastructure.** — Platforms such as Salesforce are exposing their full capabilities via APIs and CLI tools, allowing existing agents to perform CRM work directly through a decoupled experience layer, rather than requiring human logins or specialized agent tools. [[sources/dQK_pTXrGDk]] (TRD-056)
- **Stablecoin rails for machine-to-machine payments** — Tiny, frequent, software-native payments (an agent paying per API or model call) fit stablecoin rails (USDC) via Coinbase x402 (reviving the dormant HTTP 402) and Stripe's machine payments protocol better than card fees, while cards and wallets persist for consumer protection [[sources/j5_wcDifNko]].
- **The "knowledge layer" race beyond vector search** — Every serious infrastructure vendor is racing to build an agent knowledge layer: Pinecone Nexus/NoQL (retrieval carries policy, provenance, budget — not just similarity), Page Index (hierarchical document trees, no embeddings, 98.7% on FinanceBench), SAP's >€1B Dreemio + Prior Labs (tabular foundation models), and Microsoft GraphRAG for relational data [[sources/lqiwQiDglGk]].
- **Uneven acceleration: human vs AI scaling laws** — App-layer teams scale on "AI scaling laws" while root-level platform/infra teams (which must stay near-100% correct) remain on "human scaling laws," creating a power-law disparity and a double whammy of more app-layer code plus their own systems needing agentic upgrades [[sources/z3pbrFKVyQE]].
- **Agent substrates shape the customer experience** — The agent stack needs to "stop being a list of acronyms and start being buildable"; protocols are opinionated (auth-token lifetime, US-/non-micropayment assumptions), so the boring substrate details (fees, returns, authorization duration) are a customer-experience choice, not just a technical one [[sources/zP6TnEiueEc]].

## Prompt commands

### Infrastructure landscape, 2025-2026 — `TRD-005`
```
[REFERENCE ONLY — infrastructure landscape, 2025-2026] Six-layer agent stack: (1) Compute/sandboxing: E2B, Daytona, Modal, Browser Base; (2) Identity/comms: Agent Mail; (3) Memory/state: Mem0 (graph+vector+KV); (4) Tools/integrations: Compose.io; (5) Provisioning/billing: Stripe Projects; (6) Orchestration: biggest gap, no winner. Use this when selecting infrastructure for agent projects.
```

### Infrastructure gaps, 2025-2026 — `TRD-006`
```
[REFERENCE ONLY — infrastructure gaps, 2025-2026] Missing agent infrastructure (build opportunities): (1) Agent-native scheduling/lifecycle management; (2) Merge/conflict resolution for parallel agent work; (3) Configurable supervision hierarchies (meta-agents); (4) FinOps for agents (cost per successful task); (5) Standard failure/recovery patterns. Analogous to pre-Kubernetes container orchestration gap. Use this when evaluating build-vs-buy for agent infrastructure.
```

### Audit for agent-readiness — `TRD-043`
```
Audit your system for agent-readiness: (1) What startup times, authentication flows, or pagination schemes are baked in for humans? (2) If an agent needs to run 100s of times per hour, which of these become hard constraints? (3) What primitives could you replace with agent-native equivalents (persistent state, batch operations, direct data access)?
```

### Audit company for agent readiness — `TRD-015`
```
Audit [COMPANY/PRODUCT] for agent readiness: (1) Can an AI agent discover and understand the full product/service catalog without ambiguity? (2) Are pricing, shipping timelines, return policies, and availability expressed in machine-readable, unambiguous terms? (3) Can an agent complete a transaction end-to-end (discovery to evaluation to purchase) without human intervention? (4) What internal data stack changes are required — not just an API wrapper, but clean data from source systems? Prioritize the gaps by impact on agent discoverability.
```

## Related
- [[concepts/issue-tracking-evolution]] — AI integration in issue tracking substrates
- [[concepts/ai-economy-and-bottlenecks]] — economic bottlenecks created by AI
- [[concepts/local-ai-hardware]] — on-device AI hardware selection
- [[concepts/generative-ui-strategy]] — ephemeral AI-generated interfaces

## Sources

-   [[sources/7HP1jFJ9W1c]] — The Missing Orchestration Layer Destroying Teams Right Now
-   [[sources/XlfumXPPrLY]] — Your AI Is 50x Faster. You're Getting 2x.
-   [[sources/BE4RclIGDmY]] — McKinsey Says $1 Trillion In Sales Will Go Through AI Agents. Most Businesses Are Invisible.
-   [[sources/dQK_pTXrGDk]] — Salesforce Killed The Browser. Every Agent Runs Your CRM Now.
```
- [[sources/j5_wcDifNko]] — ChatGPT Has 900M Weekly Users. Almost None Can Buy In It.
- [[sources/lqiwQiDglGk]] — Pinecone Just Demoted Vector Search. Here's the Knowledge Layer.
- [[sources/z3pbrFKVyQE]] — The Infrastructure Nightmare Nobody Is Talking About
- [[sources/zP6TnEiueEc]] — Google Spent a Year Stitching MCP, A2A, AG-UI Together. I/O Today.