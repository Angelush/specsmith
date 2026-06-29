---
title: Agent Harness and Maintenance
type: concept
slug: agent-harness-and-maintenance
tags: [agent-design, harness, maintenance, ownership, reliability, last-mile, framework]
sources: [BOXK2XFLA-E, Zp8lr6IzUnQ, rh_PcL26zls]
stability: evolving
updated: 2026-06-29
---

# Agent Harness and Maintenance

The harness (or "workbench") is everything around the model that turns a "brain in a jar" into a useful worker: what the agent reads, what it remembers, which tools it can touch, what it is allowed to change, what proof it must bring back, and what stops it when work gets risky. Maintenance is the ongoing discipline of keeping that harness healthy as the model underneath improves and the world around it drifts. This concept treats agents less like apps you launch and walk away from, and more like sailboats that live in motion and require continuous upkeep.

## Why it matters

A model swap is never just a model call swap — it replaces a whole work system, which is why cheap, capable open models don't automatically displace expensive frontier ones. The scarce "last-mile" talent to build and maintain harnesses, not raw intelligence, is what gives frontier providers durable pricing power and creates large opportunity for builders. Unmaintained or unowned agents are actively dangerous because they are proactive: they keep producing plausible work from stale context, moving labor into the review stage instead of removing it.

## Key insights

- **Better agents come from removing tools, not adding them** — Vercel improved its sales agent by deleting ~80% of its tools. The beginner instinct is to add (more tools, memory, integrations); the maintenance instinct is to ask what should be removed. Study a strong human's *observed* workflow (not the paper workflow), build the agent around it, then prune. [[sources/BOXK2XFLA-E]]
- **Agents can break when the model gets *better*** — A harness tuned for a weak model (strict tools, narrow prompt, "don't infer") can trap or underuse a stronger one; a clumsy model given broad access because "a human will catch it" becomes dangerous when it can suddenly take 20 plausible actions in minutes. Yesterday's harness can become wrong overnight at the price of an update. [[sources/BOXK2XFLA-E]]
- **Agents inherit all the crud of the systems around them** — A stale wiki, a drifted CRM field, or an outdated dashboard definition is merely annoying to a human but dangerous to an agent, because the agent doesn't know it's stale and keeps producing convincing work from it. The frontier labs' implicit bet is that they can use better models to ship and evolve the harness faster (e.g., Codex as a maintained operating surface). [[sources/BOXK2XFLA-E]]
- **Switching models replaces a work system, not a model call** — Flo Crivello's Lindy team had to rewrite their harness from scratch around DeepSeek — prompts, memory, tool calls don't lift-and-shift. The move only pays off when ROI is clear (e.g., a service business cutting its own token costs); for internal users the incentive to wade through harness-building is weaker. [[sources/Zp8lr6IzUnQ]]
- **The last mile, not intelligence, is the moat** — GLM 5.2 can be ~98% cheaper and as good on most work, yet Anthropic and OpenAI keep pricing power because building the harness (tool calls, memory, system prompt tuned for a center-of-distribution model) requires scarce AI talent that most companies can't hire. This is a large, durable opportunity for agencies and builders who can refactor agentic pipelines onto cheaper open models without losing quality. [[sources/Zp8lr6IzUnQ]]
- **Team harnesses risk "renting your company brain back to yourself"** — Sticky team-level harnesses like Claude Tag (tag Claude in Slack) quietly absorb the messy company context no one codifies, becoming impossible to rip out no matter how cheap alternative models get. If data is alpha, leaders should deliberately decide whether to rent context and intelligence from a frontier provider or own the last mile themselves. [[sources/Zp8lr6IzUnQ]]
- **Care and feeding: job, diet, boundaries, review loop** — Give an agent (1) a *job* statable in one sentence (vague = too vague); (2) a *diet* — the context it reads, kept fresh and unbloated, since a stale/messy diet makes a stale/messy agent; (3) *boundaries* — start read-only or draft-only and let it earn permission, because send/merge/write-to-system-of-record are different risk categories; (4) a *review loop* — run, review, improve, run again. [[sources/rh_PcL26zls]]
- **Every agent that does real work needs a single named owner** — If a system reads important context, produces work you or your team act on, or touches a shared workflow, one person must own it; if nobody will own it, it probably shouldn't be doing important work and should be decommissioned. Maintain a lightweight agent roster / "owner card" (name, owner, job, sources, can-do, can't-do, failure mode) so humans — not just A2A protocols — can see what agents are doing. [[sources/rh_PcL26zls]]
- **Maintenance is the 2026 skill** — Prompting was the 2023 skill, delegation the 2025 skill, and maintenance is the 2026 skill. Catching up with AI is not having the most agents or knowing every tool; it's owning a small number of agents that deliver real value in workflows — knowing what they eat, what they can touch, and when to trust them. [[sources/rh_PcL26zls]]

## Prompt commands

### Agent owner card — `rh_PcL26zls`
```
For each AI agent I rely on, fill out an owner card: (1) Name. (2) Owner — the single person accountable. (3) Job — what it does, in one sentence. (4) Diet/sources — exactly what context it reads. (5) Can do — permitted actions. (6) Can't do — forbidden actions. (7) Review cadence — how often, by whom. (8) Known failure modes to watch for. Flag any agent where the owner is unclear or the job needs more than one sentence — those need fixing or decommissioning.
```

### Harness pruning audit — `BOXK2XFLA-E`
```
Audit this agent's harness for over-build: [DESCRIBE AGENT + ITS TOOLS/RULES/PROMPT]. (1) List every tool, rule, and instruction. (2) For each, ask: was this added to compensate for a weaker past model? Could a current model handle it without the scaffolding? (3) Which tools are rarely used or overlap? (4) Which rules now constrain a capable model instead of protecting against a clumsy one? Recommend what to delete first, and what proof/verification to keep.
```

## Related
- [[concepts/practical-agent-adoption]] — adopting agents and the prompt→delegation→maintenance arc
- [[concepts/agent-orchestration-architecture]] — designing the orchestration layer agents run in
- [[concepts/model-selection-frameworks]] — choosing models and the center/edge-of-distribution split
- [[concepts/open-brain-systems]] — portable memory and procedure layers that travel across harnesses
- [[concepts/agent-evaluation-and-reliability]] — proof and verification standards for agent work
- [[orgs/anthropic]] — Claude Tag as a sticky team-level harness
- [[orgs/openai]] — Codex as a maintained operating surface

## Sources

- [[sources/BOXK2XFLA-E]] — Don't build more AI agents until you watch this
- [[sources/Zp8lr6IzUnQ]] — GLM 5.2 Is Free And Beats Claude On Most Work. So Why Can't Companies Switch?
- [[sources/rh_PcL26zls]] — You Can't Run AI Agents Without This
