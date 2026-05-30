---
title: Claude Code Agent Architecture
type: concept
slug: claude-code-architecture
tags: [agent-design, claude-code, architecture, primitives, harness, loop]
sources: [EDcWcPueRSE, FtCdYhspm7w, ro5jpbi5uYc, vqnAOV8NMZ4, 09sFAO7pklo, 3e7gmNPr5Vo, 0jSE0NABcY8, 2qHxfwvIx-I, ywIK4dNGFZU, CDClFY-R0dI, p9acrso71KU]
stability: evergreen
updated: 2026-05-12
---

# Claude Code Agent Architecture

Claude Code's architecture emphasizes a loop-based philosophy, contrasting with linear task-oriented agents like OpenAI's Codex. This design allows for persistent, collaborative work sessions where context compounds over time, utilizing leaked architectural primitives and a robust harness for managing state and tools. It represents Anthropic's strategic move towards an "always-on" cross-surface execution layer for workplace agents.

## Why it matters

Anthropic's approach to agent architecture, particularly with Claude Code, provides a blueprint for building resilient, proactive, and deeply integrated AI systems. Understanding its loop-based design, critical primitives, and harness strategies is essential for developing production-grade agents that can operate autonomously, persist state through failures, and scale effectively in complex environments. This architectural choice informs strategic decisions for platform development and the future of AI-powered workflows.

## Key insights

- **Loop-based philosophy for persistent collaboration** — Claude Code operates as a general-purpose, persistent loop agent that excels in open-ended, evolving collaborative work where context accumulates, in contrast to linear, task-specific agents like Codex. [[sources/EDcWcPueRSE]] (AGD-022)
- **Four day-one non-negotiable primitives for production agents** — A metadata-first tool registry, a three-tier permission system, crash-persistent session state, and distinct workflow state separate from conversation state are foundational for building robust, scalable, and secure production-grade agents. [[sources/FtCdYhspm7w]] (AGD-023)
- **Always-on ambient agents are the platform endgame** — Anthropic's leaked "Conway" reveals an always-on agent environment with sidebar UI, extensions, connectors, and automatic triggers, signaling a shift from chat windows to proactive agents that can learn and act autonomously, even overnight. [[sources/ro5jpbi5uYc]] (AGD-033)
- **Composing primitives for true agent autonomy** — Memory (e.g., OpenBrain SQL database), proactivity (e.g., Claude Code's /loop feature for scheduled autonomy), and robust tool access (e.g., MCP tool sets) are the three essential primitives for building autonomous agents without the security risks of third-party always-on tools. [[sources/vqnAOV8NMZ4]] (AGD-035)
- **Bash and structured artifacts for powerful harness architecture** — Claude Code's effectiveness is amplified by its harness architecture, which leverages Unix primitives (like grep, git, npm) via bash for chaining actions and utilizes structured artifact files (e.g., CLAUDE.md) for institutional memory, promoting incremental, testable development. [[sources/09sFAO7pklo]] (TUL-003)
- **Dispatch, Scheduled Tasks, and Computer Use enable continuous operation** — Claude provides primitives like cloud-based Scheduled Tasks (cron-like execution), Dispatch (spawning parallel work sessions from mobile), and Computer Use (navigating applications without APIs) to create agents that work continuously without human intervention. [[sources/3e7gmNPr5Vo]] (TUL-005)
- **Strategic shift from assistant to cross-surface execution layer** — Anthropic's strategy involves transitioning Claude from a chat assistant to an agent system that operates as a cross-surface orchestration layer across various platforms (Chrome, Slack, mobile) and emphasizes organizational standardization and safety-forward agency. [[sources/0jSE0NABcY8]] (TRD-002)
- **Code-first approach as a "Trojan horse" for workplace dominance** — Anthropic uses a code-first strategy with Claude Code to penetrate the workplace, leveraging code's verifiable feedback loops and high-leverage customers to build agent capabilities that are transferable to general knowledge work, aiming for broader "Claude Agent" workplace dominance. [[sources/2qHxfwvIx-I]] (TRD-009)
- **Winning AI tools collapse distance to the artifact** — The most effective AI tools minimize the distance between the AI and the actual artifact or data being worked on, integrating directly into the work surface rather than requiring users to switch contexts. [[sources/ywIK4dNGFZU]] (TUL-016)
- **Command-line design workflow with `design.md`** — Tools like Google Stitch can generate UI components from natural language prompts and export design decisions into an agent-readable `design.md` file, enabling coding agents to directly interpret and build according to design specifications, eliminating manual design-to-dev handoffs. [[sources/CDClFY-R0dI]] (TUL-008)
Local-first agents offer capability with inherent security risks — Local-first agentic assistants like OpenClaw provide full capability by connecting messaging apps and LLM backends to local system tools, but they introduce significant security risks, particularly concerning credential and conversation history exposure if not carefully designed. [[sources/p9acrso71KU]] (TUL-013)

## Related
- [[concepts/codex-agent-architecture]] — Codex tool-shaped philosophy and sandboxing
- [[concepts/openai-atlas-browser]] — AI-native browser and agentic web use
- [[concepts/microsoft-copilot-ecosystem]] — Microsoft Copilot integrations
- [[concepts/chatbot-limitations-and-ux]] — structural gaps in chat interface design
- [[orgs/anthropic]] — maker of Claude; referenced in safety and tool discussions
- [[orgs/google]] — referenced in model competition and research landscape

## Sources

### Audit current agent architecture — `AGD-023`
```
Audit my current agent architecture against 4 baseline Claude Code primitives: (1) Do I have a metadata-first tool registry that can be queried without invoking any tool? (2) Do I have a tiered permission system that classifies each tool as read-only, mutating, or destructive with different approval logic? (3) Can my agent fully reconstruct its state (conversation + permissions + token counts + config) after a crash without starting over? (4) Do I track workflow state (current step, side effects, retry safety) separately from conversation history? For each gap, suggest the minimal implementation to close it.
```

### Design a proactive agent — `AGD-035`
```
Design a proactive agent using these three primitives for this use case: [USE CASE]. (1) What should be stored in persistent memory (what does the agent need to remember across sessions)? (2) What schedule should the agent wake on (/loop cadence)? (3) What tools/APIs does it need to call to do its work? (4) What is the output or action it takes each run? (5) What verification tells you the run succeeded?
```

### Design an always-on agent with Claude's 3 primitives — `TUL-005`
```
Design an always-on agent using Claude's 3 primitives for [USE CASE]: (1) Scheduled Task — what should run on cron even when laptop is off? Define schedule, MCP connections needed, env vars. (2) Dispatch — what phone commands should spawn parallel desktop work sessions? Define each session's context/file access. (3) Computer Use — which steps require navigating apps with no API? (4) Compose: scheduled task → classified capture → Open Brain MCP → dispatch-triggered action. Test: does this do work while you sleep?
```

### Evaluate this AI tool using the artifact-distance test — `TUL-016`
```
Evaluate this AI tool using the artifact-distance test: Tool: [NAME]. (1) Where does my actual work happen (what surface, database, or document)? (2) Does this tool operate there, or do I have to leave my work surface to use it? (3) What is the exact output artifact I need — and does the tool produce that directly? (4) Does this tool replace something already in the budget? Score 1-5 on artifact proximity and budget replaceability.
```

### Design with Google Stitch and `design.md` — `TUL-008`
```
Design a [PRODUCT TYPE] for [USER GOAL]. Hero section: [DESCRIPTION]. Key sections: [LIST - e.g., feature benefits, pricing with 2 tiers, FAQ]. Visual direction: [MOOD/STYLE - e.g., clean, minimal, professional]. Generate 3 direction variants. Then export design.md for use with my coding agent.
```

## Related
- [[concepts/codex-agent-architecture]] — Codex tool-shaped philosophy and sandboxing
- [[concepts/openai-atlas-browser]] — AI-native browser and agentic web use
- [[concepts/microsoft-copilot-ecosystem]] — Microsoft Copilot integrations
- [[concepts/chatbot-limitations-and-ux]] — structural gaps in chat interface design
- [[orgs/anthropic]] — maker of Claude; referenced in safety and tool discussions
- [[orgs/google]] — referenced in model competition and research landscape

## Sources

- [[sources/EDcWcPueRSE]] — I Tested Both Claude & Codex—They're Building Opposite Futures
- [[sources/FtCdYhspm7w]] — I Broke Down Anthropic's $2.5 Billion Leak. Your Agent Is Missing 12 Critical Pieces.
- [[sources/ro5jpbi5uYc]] — I Analyzed 512,000 Lines of Leaked Code. It Shows What's Coming for Your AI Tools.
- [[sources/vqnAOV8NMZ4]] — Anthropic Just Gave Your AI Agent the One Thing OpenClaw Has. Without the Risk.
- [[sources/09sFAO7pklo]] — Claude Code vs Codex: The Decision That Compounds Every Week You Delay
- [[sources/3e7gmNPr5Vo]] — Anthropic Just Gave You 3 Tools That Work While You're Gone.
- [[sources/0jSE0NABcY8]] — Claude Code Snuck in 7 Updates in 2 Weeks
- [[sources/2qHxfwvIx-I]] — Anthropic's Trojan Horse: How Claude Code Plus a Million Tokens Could Win the Workplace
- [[sources/ywIK4dNGFZU]] — Why the Best AI Tools Look NOTHING Like ChatGPT
- [[sources/CDClFY-R0dI]] — A Markdown File Just Replaced Your Most Expensive Design Meeting. (Google Stitch)
- [[sources/p9acrso71KU]] — Clawdbot to Moltbot to OpenClaw: The 72 Hours That Broke Everything (The Full Breakdown)
