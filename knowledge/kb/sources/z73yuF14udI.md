---
title: Opus 4.8 Scored 81. Your Workflow Doesn't Care.
type: source
video_id: z73yuF14udI
url: https://www.youtube.com/watch?v=z73yuF14udI
playlists: []
concepts: [model-selection-frameworks, agent-harness-and-maintenance, agent-orchestration-architecture]
updated: 2026-10-19
---

# Opus 4.8 Scored 81. Your Workflow Doesn't Care.

Nate argues Opus 4.8 is a strong checkpoint but not a daily driver: scaling reasoning effort is not predictably better (on Vending Bench, 4.8 regressed versus 4.7 and "high" beat "max"), the model can overthink itself on alignment questions, and the surrounding harness (Codex with 5.5 vs Claude Code/Cowork with 4.8) decided real long-running tasks. He highlights /workflows (a model composes and discloses a multi-agent workflow) and warns that agents pile up downstream work unless the whole pipeline is agent-native with humans over the loop. He advises tying budget to outcomes and architecting for model swaps.

## Concepts covered

- [[concepts/model-selection-frameworks]] — pick per outcome and harness, test reasoning-effort settings empirically, keep model swap an API change.
- [[concepts/agent-harness-and-maintenance]] — harness fit often outweighs raw model score; re-tune scaffolding as models improve.
- [[concepts/agent-orchestration-architecture]] — transparent composed workflows and the downstream piling problem; agent-native pipelines with humans over the loop.

## Notable quotes

- "It doesn't matter how smart your model is. I can't pick it."
- "Humans are increasingly over the loop, not in the loop."
- "Don't pick a winner."

## Provenance

`data/transcripts/z73yuF14udI.txt`
