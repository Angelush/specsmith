---
title: Nobody Typed A Line Of OpenAI's Million-Line Product. You Can Work This Way Too.
type: source
video_id: HZLPhPbw3fM
url: https://www.youtube.com/watch?v=HZLPhPbw3fM
playlists: [0]
concepts: [agent-memory-systems]
updated: 2026-08-20
---

# Nobody Typed A Line Of OpenAI's Million-Line Product. You Can Work This Way Too.

Starting from three OpenAI engineers shipping a 1,500-PR, million-line internal product with zero hand-typed code, Nate extracts the technique behind long-running (6-10+ hour, multi-session) agent work: separating four kinds of context — stable instruction, current project state, a map of where materials live, and history — and treating "current state" as the thing you actively rewrite as the work teaches you what the job really is ("progressive context shaping"). He backs this with OpenAI's agents.md-as-map pattern, Anthropic's progress-file harness for long-running Claude Code sessions, ARISE's "Alex" agent (27 calls spent reorganizing its own to-do list until the plan moved onto disk), a live 3-way experiment showing a focused, update-as-you-go context package beats both a default run and a maxed-out context window, and Anthropic's 400K-session finding that humans make roughly 70% of planning decisions while Claude makes roughly 80% of execution decisions.

## Concepts covered

- [[concepts/agent-memory-systems]] — the four-way context split (stable instruction / current state / map / history) that defines progressive context shaping; OpenAI's and Anthropic's convergent agents.md-map + progress-file patterns at production scale; ARISE's "Alex" fix (move the plan onto disk, rebuild it in front of the noisy transcript on every call); a 3-way experiment showing a focused, updatable context package beats a maxed-out context window; the 70%-planning/80%-execution human/agent split and why changing state beats correcting only the draft in front of you.

## Notable quotes

- "A giant instruction file... will crowd out the task... a huge manual for the project as a whole will turn into, in their words, a graveyard of stale rules."
- "The job is not to defend your original prompt... The job is to change what the agent treats as the current version of the assignment."
- "This is how you get the benefit of a six-hour agent without asking a six-hour old prompt to keep running your project."

## Provenance

`data/transcripts/HZLPhPbw3fM.txt`
