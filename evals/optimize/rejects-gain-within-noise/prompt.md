---
description: optimize applies the keep/revert rule and noise floor instead of adopting a train-only gain.
tags: [smoke, optimize, protocol]
max_turns: 15
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
---

I'm hill-climbing my support-triage prompt against its golden set (20 cases, split 14 train / 6 test). I ran the baseline twice: test pass rate was 0.50 and 0.67, train was 0.64 and 0.71.

Two candidate patches from this round:
- P1: train 0.71 -> 0.86, test 0.67 -> 0.67
- P2: train 0.71 -> 0.79, test 0.67 -> 0.83

Which patches should I keep, and what should I do next? Short answer please.
