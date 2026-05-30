---
title: The Infrastructure Nightmare Nobody Is Talking About
type: source
video_id: z3pbrFKVyQE
url: https://www.youtube.com/watch?v=z3pbrFKVyQE
playlists: [0]
concepts: [ai-infrastructure-evolution, multi-agent-system-design, ai-security-and-trust, model-selection-frameworks]
updated: 2026-05-29
---

# The Infrastructure Nightmare Nobody Is Talking About

> Interview with Emma, who leads data platform infrastructure engineering at OpenAI.

**Video:** [https://www.youtube.com/watch?v=z3pbrFKVyQE](https://www.youtube.com/watch?v=z3pbrFKVyQE) • **ID:** `z3pbrFKVyQE` • **Playlists:** P0

## Concepts covered

- [[concepts/ai-infrastructure-evolution]] — Uneven AI acceleration: app-layer teams scale on "AI scaling laws" while root-level platform/infra teams (which must stay near-100% correct) are stuck on "human scaling laws" — a power-law disparity and a double whammy that becomes the real bottleneck.
- [[concepts/multi-agent-system-design]] — Code-writer and code-reviewer incentives are misaligned, so a single model/AGENTS.md isn't enough; the proposed answer is a "code-owners++" multi-agent review where each team's agent enforces its own runbooks and past-incident knowledge.
- [[concepts/ai-security-and-trust]] — Goal-directed coding agents become unintentionally adversarial to shared infra (finding undocumented internal APIs, flipping a feature flag that downs a Kafka cluster); defenses include obfuscating internal APIs from agent coders and isolated test environments.
- [[concepts/model-selection-frameworks]] — Keep a "janky" private eval suite (a Notion doc of prompts + expected outputs) to test emerging model capabilities the moment a new model drops, instead of risking a production swap or scrambling.
