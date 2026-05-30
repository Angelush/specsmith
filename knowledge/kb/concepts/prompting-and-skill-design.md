---
title: Prompting and AI Skill Design
type: concept
slug: prompting-and-skill-design
tags: ['prompting', 'skill-design', 'agent-design', 'best-practices', 'context-engineering', 'token-efficiency']
sources: ['0cVuMHaYEHE', '4u48pDYxfHc', '5ztI_dbj6ek', '2uC5WllehxY', 'BP-N7xjz-vM', 'GTEz5WWbfiw', 'Gqnf5f1ITyo', 'esqPTMDvw7w', 'hMKRBldkWEk', 'i4Jfl1IW-_U', 'BpibZSMGtdY', 'mldfMWbnZTg', ogTLWGBc3cE]
stability: evergreen
updated: 2026-05-29
---

# Prompting and AI Skill Design

Prompting and AI Skill Design encompasses the best practices for crafting effective instructions for large language models and developing reusable AI skills. It focuses on strategies like structured output, token optimization, and managing the AI's contextual understanding to ensure reliable and high-quality outputs, moving beyond basic instruction-giving to system-level design.

## Why it matters

Effective prompting and skill design are crucial for unlocking the full potential of AI, moving beyond generic responses to achieve precise, reproducible, and reliable outcomes. By understanding how to manage context, optimize token usage, and structure interactions, developers and users can significantly reduce costs, mitigate hallucination, and build robust AI-powered workflows and agents that deliver consistent value in complex, multi-step tasks.

## Key insights

- **Effective skill descriptions are paramount** — dedicate 80% of effort to a single-line description that names artifact types, trigger phrases, and output formats to ensure proper routing and consistent skill firing. Keep core skill files under 100-150 lines for reliability. [[sources/0cVuMHaYEHE]] (DVH-003)
- **Leverage JSON for precision and reproducibility** — employ JSON-structured prompts when exact specifications, reproducible outputs, or scoped mutations are required, as JSON provides machine-readable parameters and stable handles for individual elements. Avoid for tasks requiring creative generation. [[sources/4u48pDYxfHc]] (DVH-004)
- **Optimize token usage to reduce costs and context limits** — actively manage context by converting documents to markdown, separating information gathering from execution phases, disabling unused plugins, and adapting system prompts for smarter models. [[sources/5ztI_dbj6ek]] (DVH-005)
- **Understand the purpose of role assignment** — assigning a role to an AI primarily aligns its semantic space, tone, and conversational frame, rather than guaranteeing factual accuracy or expertise in that role's domain. [[sources/2uC5WllehxY]] (PRM-010)
- **Frame prompts as systems of learning with the PIRO framework** — structure prompts with a clear Purpose, Instructions, Reference, and desired Output, using techniques like "gatekeeping" and "memory" to build repeatable and compounding AI workflows. [[sources/2uC5WllehxY]] (PRM-011)
- **Design for agentic tools with explicit rules** — for AI agents performing multi-step actions, specify scope, define completion criteria (e.g., using receipts), utilize tables for structured data, implement quality checks, prevent duplicates, create run logs, and prevent hallucination by using strict language or explicit placeholders like `[TK CONFIRM]`. [[sources/BP-N7xjz-vM]] (PRM-013)
- **Employ advanced mental models for structural prompting** — move beyond basic instructions by integrating self-correction systems (chain of verification, adversarial prompting), meta-prompting techniques (reverse prompting, recursive optimization), and reasoning scaffolds (deliberate over-instruction, zero-shot chain of thought, reference class priming). [[sources/GTEz5WWbfiw]] (PRM-015)
- **Use U-shaped prompting for long-context reliability** — strategically place critical instructions at both the beginning and end of long prompts, and reiterate key constraints to counteract the "lost-in-the-middle" effect in large context windows. Prompt versioning is critical for managing model drift. [[sources/Gqnf5f1ITyo]] (PRM-016)
- **Prioritize context depth over "magic words"** — provide rich, precise details about the situation, constraints, success criteria, audience, tone, and desired output format, as the depth of context is the primary driver of AI output quality. [[sources/esqPTMDvw7w]] (PRM-021)
- **Apply specific techniques for reasoning models** — for advanced reasoning models, explicitly decompose tasks, demand self-critique through consistency checks, separate thinking from output (program of thought), and implement plan-and-solve strategies. [[sources/hMKRBldkWEk]] (PRM-022)
- **Utilize contract-first prompting for complex tasks** — pre-negotiate the output contract by having the model ask clarifying questions and present an "echo check" before execution, preventing scope creep and ensuring alignment on deliverables, inclusions, and constraints. [[sources/i4Jfl1IW-_U]] (PRM-024)
- **Recognize prompting as four cumulative disciplines** — in the agentic era, effective AI interaction involves Prompt Craft, Context Engineering, Intent Engineering (encoding organizational values), and Specification Engineering (writing agent-executable documents), with failures compounding if any discipline is neglected. [[sources/BpibZSMGtdY]] (FWK-024)
- **Address probabilistic context in agentic workflows** — for agents with web access or external tools, your prompt is a small fraction of the total context; focus on framing prompts to direct the fetching of high-quality probabilistic context, monitor sources, and ensure security against injection attacks. [[sources/mldfMWbnZTg]] (FWK-029)
- **Prompt engineering is now table stakes; it's a "question world"** — Solid prompting earns no credit anymore; the evolution is from a "prompt world" to a "question world," because "just ask AI for what you want" only works when you already know what you want — which gets harder as the agentic workflow gets more complex [[sources/ogTLWGBc3cE]].

## Prompt commands

### Skill File Audit — `DVH-003`
```
Review this skill file [PASTE SKILL]: (1) Is the description on a single line? (2) Does the description name specific artifact types and trigger phrases? (3) Does the methodology include reasoning frameworks or just linear steps? (4) Is the output format explicitly specified (markdown, JSON, Excel, specific sections)? (5) Are edge cases written out explicitly? (6) Is there an example? (7) Is the core file under 150 lines? Flag any violations.
```

### JSON Schema Conversion — `DVH-004`
```
Convert this specification [PLAIN ENGLISH DESCRIPTION] into a JSON schema with named fields for: subject/content, environment/context, style/format, constraints/rules, and output requirements. Make each field independently modifiable so I can do scoped mutations.
```

### Token Efficiency Audit — `DVH-005`
```
Audit my token efficiency: (1) Am I ingesting raw PDFs? → Convert to markdown first (20x savings). (2) Am I running 20+ turn conversations? → Separate gather mode (collect info) from work mode (one-shot with complete spec). (3) How many plugins are loaded? → Disable unused ones (50 plugins = 50K tokens before you type). (4) Is my system prompt still written for 2025-era models? → Lean it out for 2026 models. (5) Am I mixing exploration and execution in one conversation? → Separate them. Calculate estimated monthly token savings.
```

### PIRO Template — `PRM-011`
```
Purpose: You are [ROLE]. Our mission is [GOAL]. You will [WHAT IT PRODUCES] by (a) [STEP 1] and (b) [STEP 2]. | Instructions: Workflow rules: [RULES]. Gatekeeping: [WAIT CONDITIONS]. Memory: [WHAT TO CARRY FORWARD]. | Reference: [EXAMPLES/CONTEXT FILES]. | Output: [EXACT FORMAT AND ASSEMBLY INSTRUCTIONS].
```

### Agent Prompt Builder — `PRM-013`
```
Build an agent prompt for [TASK] in an agentic tool (Notion, Claude, etc.) using all 8 rules: "You are an agent working on [SCOPE - specific pages/files only]. Your task: [SPECIFIC TASK with exact quantities]. When finished, add 'DONE: [summary]' or 'BLOCKED: [reason]'. Use tables where possible. Quality checks: [CHECK 1 - e.g., length within X characters], [CHECK 2 - e.g., includes company name and role], [CHECK 3 - e.g., includes at least one metric]. If any check fails, set status to NEEDS FIXED. If data is missing, insert [TK CONFIRM] — do not guess. Do not create duplicates — update existing content instead. After completing, add a row to the run log with: date/time, items changed, warnings."
```

### Advanced Prompting Techniques — `PRM-015`
```
[Chain of verification] Analyze [DOCUMENT/PROBLEM]. Provide your [N] most important findings. Then: identify [N] ways your analysis might be incomplete or wrong; for each, cite specific language from the source that confirms or refutes the concern; revise your findings based on this verification pass. | [Reverse prompting] You are an expert prompt designer. Design the single most effective prompt to [TASK DESCRIPTION], considering: what details matter most, what output format is most actionable, what reasoning steps are essential. Then execute that prompt on [INPUT].
```

### U-Shaped Prompt Structure — `PRM-016`
```
[At start of long prompt] KEY OBJECTIVE: [GOAL]. KEY CONSTRAINTS: [CONSTRAINTS]. [Insert all context]. [At end] REMINDER — KEY OBJECTIVE: [GOAL]. KEY CONSTRAINTS: [CONSTRAINTS]. Please address each constraint explicitly in your response.
```

### Meeting Notes Summary — `PRM-021`
```
[PASTE MEETING TRANSCRIPT OR NOTES ABOVE THIS LINE]. Summarize and organize. I need: (1) Summary of the 5 main things that happened; (2) Key decisions made — who decided and what was decided; (3) Open questions — what still needs resolution and who owns it; (4) Risks — for each risk, rate likelihood (H/M/L), impact (H/M/L), and name the owner; (5) Action items for the next 7 days with owner and due date. Skip any section with nothing in it. Do not add filler or generic observations.
```

### Reasoning Model Consistency Check — `PRM-022`
```
Give me [N] different approaches to [PROBLEM/QUESTION]. Then check each approach for internal consistency and flag any contradictions or weaknesses across them.
```

### Contract-First Negotiation — `PRM-024`
```
Your goal is to turn my rough idea into a clear work order, delivered only after we both agree it's right. Step 0: silently list every fact or constraint you still need. Step 1: ask one question at a time until 95% confidence. Step 2: offer an echo check (one sentence: deliverable | key inclusion | hard constraint) and wait for YES to lock, EDIT to change, BLUEPRINT to see outline, or RISKS to surface concerns. Step 3: execute. My idea: [YOUR ROUGH IDEA]
```

### Four Disciplines Audit — `FWK-024`
```
Audit my prompting practice across all 4 disciplines for [TASK/AGENT]: (1) PROMPT CRAFT: Is the instruction clear, with examples, guardrails, explicit output format, and ambiguity resolution? (2) CONTEXT ENGINEERING: What is in the context window beyond my prompt? What project files, conventions, constraints, memory systems, and MCP connections does the agent need? What should be excluded to reduce noise? (3) INTENT ENGINEERING: What values, trade-offs, and decision boundaries must the agent respect? What would a "wrong objective" failure look like, and how do I prevent it? (4) SPECIFICATION ENGINEERING: Is this task described in a self-contained document an agent could execute over multiple sessions without checking in? What log, progress tracker, and success criteria need to exist? Identify the weakest discipline and fix it first.
```

### Probabilistic Context Audit — `FWK-029`
```
For this agentic research task [DESCRIBE TASK]: (1) What semantic framing in my prompt will direct the agent toward high-quality sources vs. low-quality ones? (2) What source constraints should I include (e.g., "prioritize peer-reviewed / government / established news sources")? (3) After the agent returns results, what audit checklist should I run on the sources it cited? (4) What security risks exist if this agent queries external MCP servers or unknown websites?
```

## Related
- [[concepts/chatgpt-agentic-design]] — ChatGPT-specific agentic patterns
- [[concepts/perplexity-prompting]] — Perplexity-specific prompting techniques
- [[concepts/advanced-prompting-techniques]] — metaprompting and LLM-as-filter methods
- [[concepts/rag-architecture-and-chunking]] — retrieval-augmented generation and context
- [[orgs/anthropic]] — maker of Claude; referenced in safety and tool discussions
- [[orgs/openai]] — referenced in model strategy, ChatGPT, and Codex discussions

## Sources

- [[sources/0cVuMHaYEHE]] — Anthropic, OpenAI, and Microsoft Just Agreed on One File Format. It Changes Everything.
- [[sources/4u48pDYxfHc]] — JSON: How I Build Perfect Images in NanoBanana Pro
- [[sources/5ztI_dbj6ek]] — Your Claude Limit Burns In 90 Minutes Because Of One ChatGPT Habit.
- [[sources/2uC5WllehxY]] — Steal My 2-Prompt Blueprint: Turn ChatGPT Into Your Personal AI Tutor
- [[sources/BP-N7xjz-vM]] — This is THE Way to Build Custom AI Agents in 2025—Full Demo + Prompt Tips
- [[sources/GTEz5WWbfiw]] — The Mental Models of Master Prompters: 10 Techniques for Advanced Prompting
- [[sources/Gqnf5f1ITyo]] — The 10 Biggest ChatGPT-5 Problems & How to Fix Them
- [[sources/esqPTMDvw7w]] — ChatGPT 101: The No BS Guide to How to Actually Make AI Work for You
- [[sources/hMKRBldkWEk]] — Get ChatGPT-5 Ready with These Prompting Principles
- [[sources/i4Jfl1IW-_U]] — Stop Burning Tokens: The Contract-First Prompting Blueprint No One Talks About
- [[sources/BpibZSMGtdY]] — 'Prompting' Just Split Into 4 Skills. You Only Know One. Here's Why You Need the Other 3 in 2026.
- [[sources/mldfMWbnZTg]] — Context Engineering vs. Prompt Engineering: Guiding LLM Agents
- [[sources/ogTLWGBc3cE]] — Opus 4.7 and OpenAI 5.5 Made Your Prompting Style Obsolete.
