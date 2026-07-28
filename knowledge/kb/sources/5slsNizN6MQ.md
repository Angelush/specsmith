---
title: I Cut the Internet and Let AI Read the File I Could Never Upload. It Caught the Leak.
type: source
video_id: 5slsNizN6MQ
url: https://www.youtube.com/watch?v=5slsNizN6MQ
playlists: [2]
concepts: [ai-security-and-trust, model-selection-frameworks]
updated: 2026-07-28
---

# I Cut the Internet and Let AI Read the File I Could Never Upload. It Caught the Leak.

**Video:** [https://www.youtube.com/watch?v=5slsNizN6MQ](https://www.youtube.com/watch?v=5slsNizN6MQ) • **ID:** `5slsNizN6MQ` • **Playlists:** P2

## Concepts covered

- [[concepts/ai-security-and-trust]] — Instructions are not a security boundary (xAI's Grok build uploaded an entire repo despite an explicit "don't open these files" instruction), so confidential-document triage needs a hard technical guardrail: an air-gapped local model running a saved "skill" preset that masks sensitive evidence and refuses to call unreadable content safe.
- [[concepts/model-selection-frameworks]] — Enterprises are replacing one generalist chatbot with many narrow, LoRA-tuned specialist models confined inside a customer-controlled cloud boundary (Discovery Bank, Bayer), and open-source/local deployment does not automatically mean vendor independence — outsourcing that fine-tuning and hosting to a provider like Microsoft creates a dependency as serious as a frontier-model relationship.

## Notable quotes / hooks

- "Even if the model says, 'I didn't look at the file,' that file may still have gone over the wire to the model provider and may have effectively leaked."
- "In this situation, the model saying I can't tell would be better than false confidence."
- "We live in a world where all of our data needs to be accessible to AI, but not all of our data should go over the wire."

## Provenance

`data/transcripts/5slsNizN6MQ.txt`
