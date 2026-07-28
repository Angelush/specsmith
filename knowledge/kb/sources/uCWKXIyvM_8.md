---
title: Codex vs Fable: Which AI Agent Picked the Better Problem?
type: source
video_id: uCWKXIyvM_8
url: https://www.youtube.com/watch?v=uCWKXIyvM_8
playlists: [0, 2]
concepts: [prompting-and-skill-design, model-comparison-and-performance, multi-agent-system-design]
updated: 2026-07-28
---

# Codex vs Fable: Which AI Agent Picked the Better Problem?

Nate gives Codex and Fable the same open-ended brief — full access to his local files and Slacks, obligated to come back with a self-discovered problem definition and a built automation — then compares what each agent chose to solve and why. Codex's harness is fast, dependable, and friction-free but consistently picks a small, "voiced" (already-known) problem even with unlimited tokens in ultra mode; Fable is a slow, permission-dialogue-heavy hassle to run but shows superior strategic judgment, correctly identifying that Nate's hardest real problem is picking which story is worth telling. The video closes by announcing a reusable skill Nate is releasing that runs this same "audit your behavior, pick the problem, build the tool" pattern with safeguards (data walls) built in.

## Concepts covered

- [[concepts/prompting-and-skill-design]] — a "pick the problem, not just the prompt" skill pattern: give an agent full read access to your real files/communications and require it to return a problem definition, a chosen automation, and a rationale, with explicit data walls around off-limits sources and an instruction not to under-scope the eventual build.
- [[concepts/model-comparison-and-performance]] — Codex vs. Fable on the same open-ended "find and fix a real problem" brief: Codex's superior harness (reliable, fast, no permission friction, one-shot completion) trades off against a structural bias toward small, safe, already-articulated problems, even in ultra/unlimited-token mode; Fable's high-friction harness pairs with materially better strategic problem-finding.
- [[concepts/multi-agent-system-design]] — running the identical open-ended brief across multiple agents simultaneously to harvest diverse problem framings, then implementing the best-found problem with whichever tool is cheapest to execute it, decoupling "who finds the idea" from "who builds it."

## Notable quotes

- "You don't just ask it to pick the prompt. You don't just ask it to pick the tool. You ask it to pick the problem."
- "Codex's tool that it built is fine. I will probably use it. Fable's tool is now essential. I've got to have that tool."

## Provenance

Transcript: `data/transcripts/uCWKXIyvM_8.txt` (local, gitignored `.kb-pipeline/`).
