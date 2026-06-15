---
title: AI Usage Telemetry
type: concept
slug: ai-usage-telemetry
tags: [telemetry, token-usage, self-improvement, dashboard, feedback-loop]
sources: [l8BloTSLK6M]
stability: evolving
updated: 2026-06-15
---

# AI Usage Telemetry

AI usage telemetry is the practice of tracking your own token burn, model distribution, and activity patterns across AI tools and turning that data into a personal feedback loop. Rather than a vanity metric, it's a behavioral instrument: a dashboard of when, how much, and on what you're using AI.

## Why it matters

Most people have no visibility into their own AI usage patterns, so they can't tell which tools or workflows are actually "unlocking imagination" versus which ones are being underused or wasted. A personal usage dashboard turns an invisible habit into a reviewable signal, letting you spot which activities correlate with higher-quality outcomes and deliberately do more of those.

## Key insights

- **Build a personal token-burn dashboard as a self-improvement feedback loop, not a vanity metric** — Nate built a dashboard (in Codex, using an open-source "Tufte" charting skill) showing daily token burn on a log scale, a GitHub-style activity chart, top-10 usage days, and model distribution (approximating Claude usage by having Codex reason from artifacts/logs, since Claude doesn't expose token counts outside the API). The point isn't the raw number (800M tokens in a day) — it's that the chart reveals *behavioral* shifts: e.g., seeing token usage spike when adopting a new tool/workflow shows that tool is "unlocking imagination," and reviewing top-usage days reveals which activities (e.g., heavy database work, parallel multi-agent runs) correlate with higher-quality outcomes, giving a concrete signal for what to do more of [[sources/l8BloTSLK6M]].

## Prompt commands

### Token burn dashboard — `WFL-token-burn-dashboard`
```
I want to see my token burn in a github-style chart. I want to see same-day usage so I can understand what activities were burning tokens versus what weren't. I want to understand the model distribution. Help me reason from artifacts/logs to approximate my usage for models that don't expose token counts. Then show me my top 10 days for AI usage and log how my token usage is changing over time on a logarithmic scale.
```

## Related

- [[concepts/ai-personal-stack]] — personal AI tool selection and routing
- [[concepts/ai-engineering-principles]] — clarity of intent over prompt engineering
- [[concepts/multi-agent-system-design]] — multi-agent runs as a usage pattern worth tracking

## Sources

- [[sources/l8BloTSLK6M]] — My Codex Ran 800 Million Tokens in A Day. The Real Story Isn't Cost.
