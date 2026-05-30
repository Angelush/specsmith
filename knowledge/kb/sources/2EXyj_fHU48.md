---
title: Google Just Proved More Agents Can Make Things WORSE
type: source
video_id: 2EXyj_fHU48
url: https://www.youtube.com/watch?v=2EXyj_fHU48
playlists: [0, 2, 3]
concepts: [multi-agent-system-design, mcp-architecture, agent-philosophy-and-mindset, agent-orchestration-architecture]
updated: 2026-05-12
---

# Google Just Proved More Agents Can Make Things WORSE

**Video:** [https://www.youtube.com/watch?v=2EXyj_fHU48](https://www.youtube.com/watch?v=2EXyj_fHU48) • **ID:** `2EXyj_fHU48` • **Playlists:** P0, P2, P3

## Concepts covered

- [[concepts/multi-agent-system-design]] — Stop adding agents if single agent accuracy exceeds 45%, use a planner-worker-judge hierarchy, and provide minimum viable context to worker agents to prevent scope creep.
- [[concepts/mcp-architecture]] — Limit agents to 3-5 core tools, using progressive disclosure for others, as tool selection accuracy degrades with more tools.
- [[concepts/agent-philosophy-and-mindset]] — Design agents for episodic operation with external workflow state to avoid context pollution and enable clean restarts.
- [[concepts/agent-orchestration-architecture]] — Focus complexity on the orchestration layer, not individual agents, as most multi-agent failures result from specification and coordination gaps.

## Entries extracted

| ID | Category | Concept | TL;DR |
|----|----------|---------|-------|
| AGD-007 | AGENT_DESIGN | [[concepts/multi-agent-system-design]] | If a single agent exceeds 45% accuracy, stop adding agents; coordination overhead overtakes any capability gain. |
| AGD-008 | AGENT_DESIGN | [[concepts/multi-agent-system-design]] | Use planner-worker-judge hierarchy; flat agent teams collapse under scale as agents compete for tasks and diffuse responsibility. |
| AGD-009 | AGENT_DESIGN | [[concepts/multi-agent-system-design]] | Give each worker agent only the context it needs for its exact task — full project context causes agents to self-assign adjacent work. |
| AGD-010 | AGENT_DESIGN | [[concepts/mcp-architecture]] | Cap each agent at 3-5 core tools; tool selection accuracy degrades past 30-50 tools regardless of context size. |
| AGD-011 | AGENT_DESIGN | [[concepts/agent-philosophy-and-mindset]] | Design agents to terminate after bounded sessions; persist state externally so each restart begins clean without context pollution. |
| AGD-012 | AGENT_DESIGN | [[concepts/agent-orchestration-architecture]] | Put complexity in your orchestration layer, not individual agents; 79% of multi-agent failures trace to spec and coordination gaps. |
