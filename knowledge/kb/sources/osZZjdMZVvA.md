---
title: "Opus 5.5 vs The Rest: Is this the new industry standard?"
type: source
video_id: osZZjdMZVvA
url: https://www.youtube.com/watch?v=osZZjdMZVvA
playlists: []
concepts: [model-selection-frameworks, agent-evaluation-and-reliability, agent-harness-and-maintenance, prompting-and-skill-design, ai-content-creation, model-comparison-and-performance]
updated: 2026-11-03
---

# Opus 5.5 vs The Rest: Is this the new industry standard?

Nate argues that the metric that matters for a model release is cost per task, not price per token. His example: Opus 5.5 turned his logo into a 514-piece LEGO model with a 63-page instruction booklet, a parts list, a BrickLink order and a geometry check file. It used 89M tokens (at least $44 at API prices) and about 1% of his weekly plan. Opus 5.5 costs $4/$20 per million tokens, 20% below Opus 5 and 60% below Fable 5.1, and Anthropic says it fixes writing-instruction adherence. Practical lessons: measure the whole job, give long and overnight runs explicit stop conditions and a definition of done, write revision requests that state the intent to keep, use code as the medium for visual work so revisions can be surgical, and build a personal assignment test kit to re-run on every model release.

## Concepts covered

- [[concepts/model-selection-frameworks]] — compare models by cost per task across the whole job, not by token price.
- [[concepts/agent-evaluation-and-reliability]] — a personal re-run kit: same task, same setup, track tokens, usage, retries and failures.
- [[concepts/agent-harness-and-maintenance]] — persistent models need stop conditions, a definition of done and bounded scope on long runs.
- [[concepts/prompting-and-skill-design]] — revisions must preserve intent; name what to keep (uncertainty, firmness, complication).
- [[concepts/ai-content-creation]] — code-built visuals (three.js, LDraw) allow surgical revisions and machine-checkable output.
- [[concepts/model-comparison-and-performance]] — Opus 5.5 pricing, task efficiency, writing steerability and visual taste vs Fable 5.1.

## Notable quotes

- "We need to stop counting our tokens too early."
- "These models push themselves. And so, it's up to us to give them a world that they can operate within and be efficient."
- "Good AI writing preserves your intent."

## Provenance

`data/transcripts/osZZjdMZVvA.txt`
