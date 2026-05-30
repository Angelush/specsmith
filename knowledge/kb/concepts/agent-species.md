---
title: Agent Species
type: concept
slug: agent-species
tags: [agent-design, agent-species, coding-harness, dark-factory, auto-research, orchestration, architecture]
sources: [YpPcDHc3e9U]
stability: evolving
updated: 2026-05-30
---

# Agent Species

The Agent Species framework posits that the generic term "agent" is an oversimplification of several distinct architectures for Large Language Model (LLM) systems. While all agents share a common foundation of an LLM paired with tools in a feedback loop, they diverge into specialized species optimized for different scales, goals, and levels of autonomy. Effective agent design requires matching the specific species to the task at hand rather than treating all agentic workflows as a single, uniform pattern.

## Why it matters
The primary cause of failure in agentic systems is the application of the wrong architecture to a given problem. Developers often attempt to scale individual task-based agents into project-wide systems without adjusting the underlying species, leading to bottlenecks and coordination collapse. Recognizing these species allows for strategic selection between human-led judgment gates and automated, evaluation-driven optimization, ensuring the coordination overhead matches the scale of the problem.

## Key insights
- Coding/Task Harnesses (Species 1a) function as single-threaded stand-ins for individual developers, operating within an engineering process where a human manager provides task decomposition and serves as the final quality gate. [[sources/YpPcDHc3e9U]]
- Project-Scale Harnesses (Species 1b) utilize a multi-agent architecture—typically a planner agent coordinating short-lived executor agents—to manage millions of lines of code while maintaining simple management layers that scale more effectively than human-centric workflows. [[sources/YpPcDHc3e9U]]
- Dark Factories (Species 2) are fully autonomous systems designed to remove humans from the middle of the development process, instead focusing human involvement on initial specification and final risk calibration while the system iterates against automated evaluations. [[sources/YpPcDHc3e9U]]
- Auto-Research (Species 3) is an experimentation-driven species that descends from classical machine learning; it focuses on "hill climbing" to optimize specific metrics or rates, such as runtime performance or conversion, rather than producing functional software. [[sources/YpPcDHc3e9U]]
- Orchestration Frameworks (Species 4) specialize in workflow routing and hand-offs between distinct, specialized agent roles (e.g., researcher to editor), requiring significant investment in context management and prompt tuning to be viable for high-volume tasks. [[sources/YpPcDHc3e9U]]
- Problem classification is the first step in species selection, requiring a distinction between "software-shaped" problems (building products) and "metric-shaped" problems (optimizing values). [[sources/YpPcDHc3e9U]]
- The scale of human involvement defines the species; while individual harnesses prioritize human judgment, Dark Factories and Auto-Research systems prioritize relentless automated testing and data-driven feedback. [[sources/YpPcDHc3e9U]]
- Successful agent implementation avoids "hybridization failure," such as using auto-research techniques for creative software development or using a simple coding harness for massive orchestration projects. [[sources/YpPcDHc3e9U]]

## Related
- [[concepts/agent-orchestration-architecture]]
- [[concepts/multi-agent-system-design]]
- [[concepts/practical-agent-adoption]]
- [[concepts/agent-philosophy-and-mindset]]

## Sources
- [[sources/YpPcDHc3e9U]] -- Tobi Lutke Made a 20-Year-Old Codebase 53% Faster Overnight. Here's How.
