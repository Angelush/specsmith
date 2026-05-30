---
title: Model Selection Frameworks
type: concept
slug: model-selection-frameworks
tags: [framework, model-selection, agent-design, ecosystem, workflow, decision-making]
sources: [8m2-WKhidYk, dQK_pTXrGDk, 1FKxyPAJ2Ok, 9aIYhjeYxzM, -5zFZznthw0, 7G0S7DSvKxU, 8jKAT8GNDE0, ijdhIGRB_Kc, 09sFAO7pklo, LIkYVsxMpS8, z3pbrFKVyQE]
stability: evergreen
updated: 2026-05-29
---

# Model Selection Frameworks

Model selection frameworks are structured approaches designed to guide the process of choosing the most appropriate AI model or tool for a given task. They consider various factors beyond raw performance, such as capabilities, operational costs, integration with existing systems, and the surrounding ecosystem. These frameworks aim to optimize decision-making in a rapidly evolving AI landscape, ensuring effective and efficient deployment.

## Why it matters

These frameworks are crucial for navigating the rapidly evolving AI landscape. They provide structured approaches to evaluate new AI tools and models, ensuring that selection aligns with actual task requirements, team workflows, and long-term strategic goals. By systematically assessing capabilities, costs, and ecosystem factors, organizations can avoid over-engineering, mitigate integration challenges, and focus on solutions that deliver clear, measurable value rather than falling for fleeting hype.

## Key insights

-   **Evaluate AI tools comprehensively:** When selecting AI tools, especially agentic ones, go beyond surface-level comparisons. Use frameworks like MACE (Modality, Autonomy, Complexity, Environment) to understand their architectural profiles and ensure compatibility with your needs, preventing direct comparison of incompatible tools [[sources/8m2-WKhidYk]] (FWK-020). For new agent launches, employ a rapid five-question filter focusing on infrastructure integration, extensibility, data access, ecosystem presence, and composability to discern genuine value from hype [[sources/dQK_pTXrGDk]] (FWK-051).
-   **Match technology to task complexity:** Always choose the simplest technology rung (data processing, classical ML, LLMs, or AI agents) that captures at least 90% of the required value, as costs and maintenance burdens scale exponentially with complexity [[sources/1FKxyPAJ2Ok]] (FWK-004). Decompose complex workflows into atomic tasks, then match each specific task to the most appropriate model capability to prevent stalling, looping, or hallucination [[sources/-5zFZznthw0]] (MSL-001).
-   **Consider the entire model ecosystem, not just raw weights:** As frontier models converge in core capabilities, the surrounding ecosystem (tool access, memory, compute, interfaces) becomes the primary differentiator. This "compounding ecosystem effect" significantly influences a model's real-world utility in production workflows [[sources/9aIYhjeYxzM]] (FWK-045). The market is moving towards layers (direct model, embedded wrapper, managed infrastructure); choose a "wrapper" or "layer" based on data access advantages or when the surrounding product matters more than marginal model quality differences [[sources/dQK_pTXrGDk]] (FWK-052).
-   **Prioritize tangible "simple wins" and align models with problem types:** Adopt models that deliver clear, daily, low-stakes wins to avoid decision paralysis and validate real-world value over benchmark excitement [[sources/ijdhIGRB_Kc]] (MSL-012). Map problems to specific types—Reasoning, Effort, Coordination, or Emotional/Ambiguous—to guide model selection, for example, using "naked reasoners" like Gemini for pure logic and "equipped reasoners" like Claude Opus for effort/coordination tasks [[sources/8jKAT8GNDE0]] (MSL-007).
-   **Model choice matters most for hard, messy tasks:** While frontier models may seem interchangeable for clean, well-specified tasks, their true differentiation emerges in complex, underspecified work that requires sustained judgment, persistence, and self-correction [[sources/9aIYhjeYxzM]] (MSL-018). When evaluating new model releases, focus on whether the "floor" (baseline competence on messy tasks) has moved, rather than just the "ceiling" (best-case performance), as floor moves have a greater impact on workflow efficiency [[sources/9aIYhjeYxzM]] (MSL-017).
-   **Beware of "harness lock-in":** Switching AI coding tools or harnesses can effectively reset all prior team process investment, including custom configurations and established habits, to zero. This lock-in emphasizes treating tools as complementary architectures rather than easily interchangeable components [[sources/09sFAO7pklo]] (DVH-002).
- **Five levers on a specificity x maturity matrix** — Per workflow, choose among automate / build / buy / hire / wait against two axes (how specific the work is to you, how mature the market solution is): common+mature = buy; common+immature = prototype or wait; company-specific+useful primitives = buy the building blocks but own the workflow standard; company-specific+thin market = build to own the category; if nobody can even define the work, the next investment is a person [[sources/LIkYVsxMpS8]].
- **Keep a janky private eval suite for emerging capabilities** — Most large teams lack the discipline of a private eval suite tuned to emerging model capabilities; a "janky" Notion doc of prompts plus expected outputs, re-run on each new model release, beats risking a production swap or scrambling to assign someone [[sources/z3pbrFKVyQE]].

## Prompt commands

### Evaluate MACE dimensions — `FWK-020`
```
Evaluate [AI TOOL] on MACE dimensions: (1) Primary modality? (2) Autonomy level: reactive/interactive/semi-autonomous/fully autonomous? (3) Complexity handling: simple/sequential/branching/dynamic replanning? (4) Execution environment: cloud-contained/IDE/platform-runtime/infrastructure-spanning? Then match to your use case — don't compare tools from different MACE profiles as if they're alternatives.
```

### Evaluate agent/AI product launch against infrastructure filter — `FWK-051`
```
Evaluate the following agent/AI product launch against the infrastructure filter: [PRODUCT NAME AND DESCRIPTION]. Answer each of five questions: (1) Does it plug into our existing stack or require migration? (2) Can other agents build on top of it (open APIs, MCP support, SDK)? (3) What data does it access that we care about? (4) What ecosystem signals exist (marketplace, SDK, shipping cadence)? (5) Can we compose our own agents on top of it? Final verdict: infrastructure play, feature play, or not relevant now?
```

### Analyze for AI solution selection — `FWK-004`
```
Analyze [PROBLEM] for AI solution selection. Determine: (1) What % of value is in data ops vs ML prediction vs LLM generation vs agentic orchestration? (2) Simplest solution capturing 90%+ value? (3) Relative cost/complexity estimate per option. Recommend the lowest-rung solution meeting a 10x ROI bar.
```

### Choose the right AI layer for workflow — `FWK-052`
```
I need to choose the right AI layer for the following workflow: [WORKFLOW DESCRIPTION]. Our current stack: [LIST OF TOOLS AND SYSTEMS]. Analyze: (1) Where does the work actually live (which data systems, which collaboration surface)? (2) Is there a wrapper product that owns that data natively? (3) Would the data/workflow advantage of the wrapper outweigh the cost of learning a new interface? (4) Is the task a one-off or a recurring team workflow that needs to be shared and governed? Recommend: direct model, embedded wrapper, or managed infrastructure.
```

### Break down workflow into atomic tasks — `MSL-001`
```
Break down the following workflow into its irreducible atomic tasks: [WORKFLOW DESCRIPTION]. For each task, identify: (1) the input, (2) the transformation required, (3) the desired output format, (4) how messy/ambiguous the input is. Then suggest which type of AI capability (synthesis, reasoning, formatting, verification) best fits each task.
```

### Model routing heuristic — `MSL-006`
```
Use this model routing heuristic: Is this simple reformatting? → GPT-4o. Is this technical architecture or code structure? → Claude Opus. Do I need to walk away and come back? → Deep Research. Do I need a second opinion on something critical? → Gemini 2.5 Pro. Everything else that requires problem-solving → o3.
```

### Classify task for model choice — `MSL-007`
```
Before choosing a model for [TASK], classify it: (1) Pure reasoning bottleneck (well-defined inputs, long logical chain)? → Gemini 3.1 Pro or GPT-5 Pro; (2) Effort/endurance bottleneck (many items, straightforward per-item logic)? → Claude Opus 4.6 agents; (3) Coordination bottleneck (routing, tracking, organizational awareness)? → Claude Opus 4.6; (4) Ambiguity/emotional bottleneck? → Human. Use configurable thinking levels (Gemini) or appropriate tier to match cost to task complexity.
```

### Identify simple daily win — `MSL-012`
```
For this recurring workflow [DESCRIBE WORKFLOW]: identify one simple, daily-use task where a new model could deliver a clear win. Success criteria: [WHAT GOOD LOOKS LIKE]. The task should be small enough that failure has low stakes and success is obvious in under 5 minutes. Test this task across [MODEL A] and [MODEL B] and compare outputs.
```

### Strategic warning: harness lock-in — `DVH-002`
```
Harness lock-in is the real vendor risk, not model subscription. All CLAUDE.md files, process habits, verification steps, and integration plumbing are harness-specific and don't transfer. Practical pattern (Calvin French Owen): use Claude Code for planning + codebase understanding, Codex for implementation. Treat them as complementary architectures, not interchangeable tools.
```

## Related
- [[concepts/model-comparison-and-performance]] — comparing model capabilities across tasks
- [[concepts/practical-agent-adoption]] — adopting agents in real workflows
- [[concepts/issue-tracking-evolution]] — AI integration in issue tracking substrates
- [[concepts/ai-personal-stack]] — personal AI tool selection and routing
- [[orgs/google]] — referenced in model competition and research landscape
- [[orgs/openai]] — referenced in model strategy, ChatGPT, and Codex discussions

## Sources

-   [[sources/8m2-WKhidYk]] — Manus AI: What Manus Tells Us About the Future of AI Agents
-   [[sources/dQK_pTXrGDk]] — Salesforce Killed The Browser. Every Agent Runs Your CRM Now.
-   [[sources/1FKxyPAJ2Ok]] — Your Boss says 'Use AI!'
-   [[sources/9aIYhjeYxzM]] — GPT-5.5 vs Claude vs Gemini: The Real Difference Nobody's Talking About
-   [[sources/-5zFZznthw0]] — The AI Prompting Mistake Costing You Hours Every Week
-   [[sources/7G0S7DSvKxU]] — Confused by o4 vs. o3? My Trick to Remember Each of the 16 Major AI Models
-   [[sources/8jKAT8GNDE0]] — Google's New AI Is Smarter Than Everyone's But It Costs HALF as Much. Here's Why They Don't Care.
-   [[sources/ijdhIGRB_Kc]] — ChatGPT 5.2 vs. Claude Opus 4.5 vs. Gemini 3: What Benchmarks Won't Tell You
-   [[sources/09sFAO7pklo]] — Claude Code vs Codex: The Decision That Compounds Every Week You Delay
- [[sources/LIkYVsxMpS8]] — When to Automate, Build, Buy, Hire, or Wait on AI
- [[sources/z3pbrFKVyQE]] — The Infrastructure Nightmare Nobody Is Talking About