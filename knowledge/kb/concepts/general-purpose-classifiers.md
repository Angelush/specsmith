---
title: General-Purpose Classifiers
type: concept
slug: general-purpose-classifiers
tags: [classifiers, architecture, cost, routing, primitives, dev-hacks]
sources: [tYugqJ9YytQ]
stability: evolving
updated: 2026-10-06
---

# General-Purpose Classifiers

A general-purpose classifier reads language and returns one of a set of outcomes the developer defines, such as a category, a score, yes/no, or probabilities. It never generates words, and it needs no per-category training. It is a third software primitive alongside deterministic code and LLMs: "complicated in, simple out." It handles the large class of judgments that rules cannot interpret and that are too expensive to send to an LLM one item at a time.

## Why it matters

Many LLM calls in production are really choices among defined outcomes, such as routing, triage, gating, and filtering, and they pay generation prices for a classification. A fast, cheap classifier changes the economics. A judgment made once per task can be made at every step or for every item, so it can serve as the outer-loop chooser in an agent harness or as a safety gate on each risky action. Specs should name which decisions are classification-shaped and give each one a defined outcome set and a follow-up per outcome.

## Key insights

- **A general-purpose classifier is a third software primitive** — The classifier (transcribed as "Jev" from "Typesafe") reads text and returns one of a developer-defined set of outcomes (category, score, yes/no, probabilities) without writing words; several questions can be evaluated at once and no per-category training is needed. This fills the gap between deterministic rules (cannot interpret "does this customer sound about to churn?") and LLMs (can, but expensively), giving three building blocks: LLMs, a general classifier, deterministic code. The speaker calls the glue between language and choice "semi-deterministic" [[sources/tYugqJ9YytQ]].
- **Four architectural placements for a classifier** — (1) Shim between messy input and existing code: triage support tickets or emails (category, urgency, churn risk, opportunity size), then route to a process or have an LLM draft the reply. (2) Attention filter over a huge pile (pick top 100 of 10,000). (3) Outer-loop chooser in a harness that picks next step: tool, cheap LLM, frontier model for exceptions, or a human; browser agents are the same problem (choose an element from limited options). (4) Live interpreter in a UI, e.g. typing "urgency" as a spreadsheet column header classifies every row, combinable with ordinary formulas [[sources/tYugqJ9YytQ]].
- **Cost and speed evidence (volatile)** — Published price is about 4.2 cents per million input tokens with no output charge (1,000 calls of 1,000 tokens is roughly 4 cents; 1M calls roughly $42); the vendor claims ~100x faster and >100x cheaper than an LLM. Reported user results: a tax-document pipeline 34x cheaper and 6x faster, 20,000 emails/Slacks/transcripts sorted in 7 minutes for about $1, and 100 top immunology questions picked from 10,000 candidates. Treat vendor numbers as claims and test on your own problem [[sources/tYugqJ9YytQ]].

## Prompt commands

### find-classifier-shaped-work
```
Use the type safe skill to find a place in the project we're working on together where asking an LLM to choose among defined outcomes is suboptimal. Build a Jev version instead. And then I want you to compare the results, compare the speed, compare the cost, and report back.
```

## Related
- [[concepts/agent-orchestration-architecture]] — classifiers as the outer-loop chooser and per-step guard
- [[concepts/model-selection-frameworks]] — routing work to the cheapest adequate primitive
- [[concepts/ai-economy-and-bottlenecks]] — Jevons paradox applied to judgment

## Sources

- [[sources/tYugqJ9YytQ]] — Why Developers Are Losing Their Minds Over AI That Can't Write
