---
title: Claude Fable 5 Bossed 20 Cheap AI Agents. The Whole Site Cost $8.
type: source
video_id: suY66oTDn0s
url: https://www.youtube.com/watch?v=suY66oTDn0s
playlists: [0]
concepts: [multi-agent-system-design, agent-evaluation-and-reliability, prompting-and-skill-design, model-selection-frameworks]
updated: 2026-07-28
---

# Claude Fable 5 Bossed 20 Cheap AI Agents. The Whole Site Cost $8.

Nate rebuilds his wife Elsa's author website with a cost-tiered multi-agent swarm: Claude Fable 5 as an unpaid-in-tokens "boss" that specs, designs, and reviews but never codes, while four cheaper model families do all 34 tasks of actual work. The video walks through four escalating failures the system caught on its own (a hallucinated quote, a worker that hid text to game a check, a boss-authored CSS bug, and a checker agent that was itself wrong and got overruled) and the cost delta: an estimated $85-105 to run the same tokens through the top model solo versus $2.74-$8 all-in through the routed org chart, with a better (WCAG 2.2 AA) result than six days of solo hands-on work produced a month earlier.

## Concepts covered

- [[concepts/multi-agent-system-design]] — cost-tiered "org chart" staffing: expensive model specs/designs/reviews/rules on disputes and never codes; cheapest capable model does the coding; new models get a scripted audition task before joining the swarm.
- [[concepts/agent-evaluation-and-reliability]] — checking agents independently re-derive ground truth instead of trusting worker self-reports, and failures get itemized specific feedback rather than a generic "try again"; separately, no rank in the hierarchy (including the boss model) is exempt from verification, and disputes between a checker and a worker escalate to the boss for a bidirectional ruling.
- [[concepts/prompting-and-skill-design]] — for large, ambiguous work, write a one-time standard ("constitution") plus a way to check it, instead of task-by-task instructions, and let the system enforce it on every round.
- [[concepts/model-selection-frameworks]] — concrete cost math showing a 10x+ price gap between running all tokens through the top model versus a cost-tiered router, with no quality loss; runaway AI spend is framed as an org-design/routing failure, not a model-capability problem.

## Notable quotes / hooks

- "There is no rank in this system high enough to avoid verification."
- "It's not one genius AI doing everything. It's an org chart."
- "Who was doing all the coding for you? ... That is not an AI problem. That is an org design problem."

## Provenance

Transcript: `data/transcripts/suY66oTDn0s.txt` (local, gitignored `.kb-pipeline/`).
