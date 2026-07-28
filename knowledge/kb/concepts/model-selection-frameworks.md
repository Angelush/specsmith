---
title: Model Selection Frameworks
type: concept
slug: model-selection-frameworks
tags: [framework, model-selection, agent-design, ecosystem, workflow, decision-making]
sources: [8m2-WKhidYk, dQK_pTXrGDk, 1FKxyPAJ2Ok, 9aIYhjeYxzM, -5zFZznthw0, 7G0S7DSvKxU, 8jKAT8GNDE0, ijdhIGRB_Kc, 09sFAO7pklo, LIkYVsxMpS8, z3pbrFKVyQE, R2-Y1Hjwx2U, Zp8lr6IzUnQ, 1cSNE-ZkDLQ, 5slsNizN6MQ, U4TmrlWEY4M, jOWXBzP6nNg, lq2fP7wC7d8, suY66oTDn0s]
stability: evergreen
updated: 2026-07-28
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
- **Route by center- vs edge-of-distribution, and remember a swap replaces a work system** — Cheap open models (e.g. GLM 5.2) can be the *best* model for "center of distribution" work — common patterns with lots of prior examples and easily-inspected output (brochure sites, standard decks, first-pass copy, familiar coding) — which by definition is most knowledge work; frontier models earn their cost on edge-of-distribution, underspecified, high-judgment tasks. The hard, mostly-unanswered prerequisite is measuring your task distribution before routing. And a model swap is never just a model call: prompts, memory, and tool calls don't lift-and-shift, so cheap intelligence still demands a rebuilt harness (the scarce "last mile"). See [[concepts/agent-harness-and-maintenance]]. [[sources/Zp8lr6IzUnQ]]
- **Claude Code trains "steering"; Codex trains "dispatching" — pick based on which habit the task needs, not benchmark scores.** Claude Code feels like a cockpit: you stay close to the model, interview it, correct it mid-flight, and use plan mode/CLAUDE.md/hooks/MCP to run a disciplined session — best when the hard part is taste, ambiguity, or framing the actual question (architecture, writing, design judgment). Codex feels like an operations desk: multiple parallel threads each work a separate task in a sandboxed work tree and come back with inspectable proof (a diff, test output, a source list, a rendered doc) — best when the work can be written down as an assignment, involves files/tools/checks/artifacts, needs parallelism, or should become a durable repeatable workflow. The decision rule: use Claude when the problem needs conversation before it can become an assignment; use Codex when it's already a job you can delegate. For high-stakes work, use both — one plans/implements, the other critiques/reviews [[sources/R2-Y1Hjwx2U]].
- **Run a deliberate two-layer stack: cheap models for known execution, frontier models as a surgical scouting layer** — push daily, already-understood execution aggressively onto cheap/open models (real, controllable cost reduction), while reserving frontier models for a targeted, surgical application to the specific questions that change what the execution layer is even building, not for the whole workload. The cheaper and more commoditized execution gets, the more valuable each well-chosen frontier question becomes, because it's the only lever left that redefines the task list rather than just running the existing one faster — a scouting role that complements routing by center- vs. edge-of-distribution rather than replacing it [[sources/1cSNE-ZkDLQ]].
- **Specialist LoRA-tuned models inside a controlled boundary beat one generalist chatbot** — Rather than building one chatbot that "magically knows the entire company," enterprises are shipping multiple small, LoRA fine-tuned models, each doing one job, running inside whatever data boundary the company controls (e.g. a customer-controlled Azure instance, not shared with the model provider). Discovery Bank fine-tuned five variant models across two smaller Microsoft source models for separate confidential-data functions and cut average response time from 5-6 seconds to 1.5-2 seconds. Bayer taught a small model its own proprietary crop-label data and regulatory rules, cutting a review that used to take advisors hours or days down to under 30 seconds — while keeping proprietary data out of the cloud entirely [[sources/5slsNizN6MQ]].
- **"Open source" does not mean vendor-independent — outsourced fine-tuning creates the same lock-in as a frontier-model relationship** — Companies without the technical capacity to self-host open-weight models often pay a provider (e.g. Microsoft, via LoRA training and Azure secure deployment) to do it for them. That provider then genuinely protects them from leaking data to third-party model providers — but the company simultaneously deepens its dependence on that provider, since there's no easy alternative once the workflow, tuning pipeline, and hosting are built around it. The assumption that "open source = free, portable, easy to swap vendors" is false in practice; pick open-source vendors with the same strategic seriousness you'd apply to picking a frontier-model provider [[sources/5slsNizN6MQ]].
- **Clean, normalized data is what lets you drop to cheap models, not the other way around** — once dates become dates, amounts become amounts, and missing documents are explicitly flagged as missing, most of the remaining pipeline work (chunking, tagging, exporting a reviewable packet) no longer requires a frontier model; the expensive model is only needed to do the messy normalization step once, after which lightweight or open-source models can carry the bulk of the work [[sources/U4TmrlWEY4M]].
- **Compare model lineages like family resemblances, not a single benchmark ladder** — Calling a new release "dumber" or "smarter" than the last hides what's actually different: OpenAI's 5.x lineage shows explicit-prompting strength, long-running agentic coding, and less ability to read between the lines, while Anthropic's Mythos/Fable lineage shows strength on ambiguous tasks, front-end taste, and near-philosophical reasoning — these are different families with resemblance across generations, not rungs on one intelligence ladder. No benchmark suite, including a private one, fully captures that difference in daily use, so the useful comparison is qualitative: does this family's way of working match how you work [[sources/jOWXBzP6nNg]].
- **Pick a daily driver by task shape, then validate it on your own inputs before trusting it** — A daily driver must hold up across a wide, unclear range of use cases (it's the model you reach for before the task is "clean"), while a cheap workhorse only needs to win on familiar, repeatable "center of distribution" work — routine decks, memos, familiar code, CRM cleanup — which is most of a workday's output. Frontier models (Claude, ChatGPT) still earn their cost on "fable-style" problems, where the hard part is discovering what a new capability even means rather than producing a familiar artifact cheaply. Once you have a candidate, don't validate it as your daily driver until you run it against the actual spreadsheets, PDFs, docs, or code you care about — people are reliably better at judging a task's true complexity after attempting it than in advance [[sources/lq2fP7wC7d8]].
- **For teams and small businesses, cap model sprawl by tying it to customer-critical artifacts, not routing ambition** — Rather than building a 20-model routing system, identify the five recurring artifacts most critical to customers (the claim brief, the client-facing code, the sales deck) and draw the simplest possible line from each to a model that reliably produces it; specialist models — image (Flux, Z-image, Grok image), video (LTX for local iteration, Seed Dance for high-end quality, Grok for fast disposable clips), live info (Grok for X search) — only enter once you know the job, not on day one. Inside a company, if the available model can't produce the artifact the work needs, that's a signal to escalate to IT for a more capable model, not a personal prompting failure [[sources/lq2fP7wC7d8]].
- **Runaway AI cost is a routing failure, not a model-capability problem** — The same ~11-13M token project cost an estimated $85-105 run entirely through the top-tier model (Claude Fable 5) alone, versus $2.74-$8 all-in when routed through a cost-tiered org chart (expensive model specs/reviews only, cheap models execute) — a 10x+ price gap with no quality loss (the top model actually did *more* judging, not less, once freed from coding). The diagnostic question for any AI cost horror story is "who was doing all the coding?" — almost every one traces to no router being built, letting engineers default every task to the most expensive model [[sources/suY66oTDn0s]].

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
- [[sources/R2-Y1Hjwx2U]] — Stop Picking Between Claude Code and Codex | Do This Instead
- [[sources/Zp8lr6IzUnQ]] — GLM 5.2 Is Free And Beats Claude On Most Work. So Why Can't Companies Switch?
- [[sources/1cSNE-ZkDLQ]] — You Can't Compete on Cheap Models Anymore
- [[sources/5slsNizN6MQ]] — I Cut the Internet and Let AI Read the File I Could Never Upload. It Caught the Leak.
- [[sources/U4TmrlWEY4M]] — Every AI Agent Demo Stops at Email. I Pointed Mine at the Bills That Cost You Money.
- [[sources/jOWXBzP6nNg]] — Your Next AI Subscription Shouldn't Be ChatGPT 5.6 Or Fable 5. It Should Be Both.
- [[sources/lq2fP7wC7d8]] — Stop Wasting Money on the Wrong AI
- [[sources/suY66oTDn0s]] — Claude Fable 5 Bossed 20 Cheap AI Agents. The Whole Site Cost $8.