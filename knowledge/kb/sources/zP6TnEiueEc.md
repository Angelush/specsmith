---
title: Google Spent a Year Stitching MCP, A2A, AG-UI Together. I/O Today.
type: source
video_id: zP6TnEiueEc
url: https://www.youtube.com/watch?v=zP6TnEiueEc
playlists: [0]
transcript: data/transcripts/zP6TnEiueEc.txt
concepts: [mcp-architecture, ai-infrastructure-evolution, agent-orchestration-architecture, ai-security-and-trust]
updated: 2026-05-29
---

# Google Spent a Year Stitching MCP, A2A, AG-UI Together. I/O Today.

**Video:** [https://www.youtube.com/watch?v=zP6TnEiueEc](https://www.youtube.com/watch?v=zP6TnEiueEc) • **ID:** `zP6TnEiueEc` • **Playlists:** P0

## Concepts covered

- [[concepts/mcp-architecture]] — Of six agent protocols, three form the core stack — MCP (what the agent can use), A2A (who it works with, via the "agent card" operating contract), AG-UI (how the human stays in control) — while A2UI/AP2/x402 are contested or domain-specific.
- [[concepts/ai-infrastructure-evolution]] — Agent substrates shape the customer experience; the agent stack must "stop being a list of acronyms and start being buildable," and protocols are opinionated (auth-token lifetime, US/micropayment assumptions) so substrate choice is a CX choice, not just technical.
- [[concepts/agent-orchestration-architecture]] — Teams overfocus on model selection and underspecify the operating surface; six diagnostic questions map a workflow onto the protocol layers (tools→MCP, other agents→A2A, approve/steer→AG-UI, structured UI→A2UI, authorize purchase→AP2, pay-per-resource→x402).
- [[concepts/ai-security-and-trust]] — MCP is a high-trust protocol, not a safety layer: tool access is arbitrary code/data execution (a security boundary, not a feature toggle), and Invariant Labs' "tool poisoning attacks" hide malicious instructions inside tool descriptions.

## Transcript

[data/transcripts/zP6TnEiueEc.txt](../data/transcripts/zP6TnEiueEc.txt)
