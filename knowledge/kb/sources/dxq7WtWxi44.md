---
title: Karpathy's Wiki vs. Open Brain. One Fails When You Need It Most.
type: source
video_id: dxq7WtWxi44
url: https://www.youtube.com/watch?v=dxq7WtWxi44
playlists: [1]
transcript: data/transcripts/dxq7WtWxi44.txt
concepts: ['agent-memory-systems']
updated: 2026-05-12
---
# Karpathy's Wiki vs. Open Brain. One Fails When You Need It Most.
**Video:** [https://www.youtube.com/watch?v=dxq7WtWxi44](https://www.youtube.com/watch?v=dxq7WtWxi44) • **ID:** `dxq7WtWxi44` • **Playlists:** P1
## Concepts covered
- [[concepts/agent-memory-systems]] — Databases are critical for multi-agent knowledge stores, unlike wikis; write-time vs. query-time synthesis is a fundamental architectural choice; users must own their context layer to avoid platform lock-in.
## Entries extracted
| ID | Category | Concept | TL;DR |
|---|---|---|---|
| FWK-042 | FRAMEWORK | [[concepts/agent-memory-systems]] | Every AI knowledge system must choose when the AI does hard thinking — at input (write-time) or at retrieval (query-time). This single decision determines what breaks at scale. |
| FWK-043 | FRAMEWORK | [[concepts/agent-memory-systems]] | A neglected wiki produces confident misinformation; a neglected database produces obvious gaps — failure mode shapes trust risk. |
| AGD-044 | AGENT_DESIGN | [[concepts/agent-memory-systems]] | Karpathy's wiki presupposes a single agent writer — concurrent multi-agent writes produce incoherent merges. Use a database for multi-agent knowledge stores. |
| PRN-001 | PRINCIPLES | [[concepts/agent-memory-systems]] | Both wiki and database memory approaches share one core principle: you own the artifact, not the platform. Build context layers you control. |
## Transcript
[data/transcripts/dxq7WtWxi44.txt](../data/transcripts/dxq7WtWxi44.txt)
