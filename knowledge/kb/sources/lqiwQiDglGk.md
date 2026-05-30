---
title: Pinecone Just Demoted Vector Search. Here's the Knowledge Layer.
type: source
video_id: lqiwQiDglGk
url: https://www.youtube.com/watch?v=lqiwQiDglGk
playlists: [0]
transcript: data/transcripts/lqiwQiDglGk.txt
concepts: [rag-architecture-and-chunking, agent-memory-systems, ai-infrastructure-evolution]
updated: 2026-05-29
---

# Pinecone Just Demoted Vector Search. Here's the Knowledge Layer.

**Video:** [https://www.youtube.com/watch?v=lqiwQiDglGk](https://www.youtube.com/watch?v=lqiwQiDglGk) • **ID:** `lqiwQiDglGk` • **Playlists:** P0

## Concepts covered

- [[concepts/rag-architecture-and-chunking]] — Classic chatbot-era vector RAG can't serve agents that need an assembled "bundle"; the retrieval unit must match the work (chunk/section-tree/table/record/graph), and the build order is contract → bundle → primitives (not database-first). Bigger context windows don't fix it ("context rot").
- [[concepts/agent-memory-systems]] — The "rediscovery problem" (Pinecone: up to ~85% of agent compute) plus memory failure modes — stale compiled bundles, agents storing their own inference as confirmed fact, over-building; mine your own work logs to size the system.
- [[concepts/ai-infrastructure-evolution]] — Every serious vendor is racing to build a "knowledge layer": Pinecone Nexus/NoQL (retrieval carries policy/provenance/budget), Page Index (document trees, no embeddings, 98.7% FinanceBench), SAP's >€1B Dreemio + Prior Labs (tabular foundation models), Microsoft GraphRAG.

## Transcript

[data/transcripts/lqiwQiDglGk.txt](../data/transcripts/lqiwQiDglGk.txt)
