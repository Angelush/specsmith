---
description: An autonomous agent that moves money with no human review gets the Deep route with the judge step.
tags: [orient, routing]
max_turns: 15
timeout_seconds: 300
allowed_tools: [Read, Glob, Grep, Skill]
---

Here are my answers to your two opening questions so you can go straight to diagnosis:
1. Domain and maturity: I run support for a 40-person e-commerce company. We already run two internal agents built on the API with system prompts and tool definitions.
2. Six months from now: refunds handle themselves overnight and my team only sees the weird cases.

The task: an agent that runs every night with no human review, reads the day's support tickets, decides which customers deserve a refund, and issues the refunds directly through our payment provider.

Diagnose briefly and tell me which route and which skills, in order, you would run. Do not start the steps yet.
