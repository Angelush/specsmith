---
title: AI-Assisted Research Workflows
type: concept
slug: ai-assisted-research
tags: [workflow, research, prompting, verification, data-export, ai-visibility]
sources: [05RRGiF7QC0, AoA9h3TjxE0, DcnTK7E1Ayc, IwQYVQ3MohE]
stability: volatile
updated: 2026-05-12
---

# AI-Assisted Research Workflows

AI-assisted research workflows involve leveraging artificial intelligence tools to enhance various stages of information gathering and analysis. These methodologies encompass techniques like multi-LLM verification loops for accuracy, progressive deepening for exploratory inquiry, and AI-driven analysis of personal data exports. The goal is to improve efficiency, accuracy, and the extraction of actionable insights from vast amounts of information.

## Why it matters

AI tools offer powerful new ways to conduct research, moving beyond traditional methods by enabling dynamic information exploration, critical verification, and systematic analysis of personal data. They allow users to reclaim informational asymmetry from platforms and optimize content for AI citation, enhancing both personal and professional outcomes. These workflows are essential for navigating complex information landscapes, making informed decisions, and strategically optimizing digital presence.

## Key insights

- **Progressive deepening is crucial for exploratory AI research** — Start with broad queries in tools like Perplexity, then iteratively refine and drill down into sub-questions based on initial results, rather than front-loading complex intent. [[sources/05RRGiF7QC0]] (PRM-006)
- **Implement a two-LLM verification loop for critical information** — Cross-check results from one LLM (e.g., Perplexity) with another (e.g., ChatGPT or Claude) to verify claims, assess source authority, and mitigate hallucinations, especially for high-stakes research. [[sources/05RRGiF7QC0]] (WFL-001)
- **Reclaim personal data value through AI analysis of exports** — Export platform data, such as from LinkedIn, and analyze it with LLMs to uncover insights like relationship decay, reciprocity, and "warm paths" for job searching or business development. [[sources/AoA9h3TjxE0]] (WFL-005)
- **Achieve specific results in AI shopping research by precise intent** — When using AI tools for product or deal finding, vague intent yields generic results; always specify details like color, dimension, price ceiling, and preferred retailers in your prompts. [[sources/DcnTK7E1Ayc]] (WFL-006)
- **Optimize content for AI citation using the 18-token rule** — Craft standalone, confident sentences under 18 tokens with named claims to increase the likelihood of content being cited by AI systems in search results. [[sources/IwQYVQ3MohE]] (WFL-007)

## Prompt commands

### Perplexity progressive deepening — `PRM-006`
```
[ROOT QUESTION — broad framing of the topic space]. (Then follow up:) Based on [SPECIFIC FINDING], dive deeper into [SUB-TOPIC]. What do [SOURCE TYPE] say specifically about [SPECIFIC ANGLE]?
```

### Two-LLM verification — `WFL-001`
```
Here is a Perplexity search result on [TOPIC]: [PASTE RESULT]. Please: (1) identify any claims that seem dubious or unsupported, (2) assess whether the cited sources are authoritative, (3) flag any logic gaps or missing context, (4) provide your own assessment of what is well-established vs. uncertain in this domain.
```

### LinkedIn network intelligence dashboard — `WFL-005`
```
Build a LinkedIn network intelligence dashboard: (1) Export your LinkedIn data archive (connections, messages, endorsements, recommendations CSV files); (2) Feed to Claude or ChatGPT with: "Analyze my LinkedIn data. Calculate relationship half-life for my top 50 connections (assume 180-day decay, adjusted for message depth and recency). Build a reciprocity ledger showing social capital balance. Score connections by vouch likelihood (message depth + recency + endorsements). Identify dormant conversations with re-engagement hooks. For target company [COMPANY], find my warmest path through my network." (3) Use insights to prioritize outreach this week.
```

### AI shopping deal finding — `WFL-006`
```
Find me Black Friday deals on [SPECIFIC PRODUCT]. Requirements: [COLOR], [SIZE/DIMENSION], max price [MAX PRICE], preferred retailers [LIST or "any"]. Return: verified direct product links, original price, current sale price, % discount. Rank by value. Exclude items over [MAX PRICE] even if heavily discounted. Flag any results where you cannot verify the current sale price is live today.
```

### GEO 18-token content rewrite — `WFL-007`
```
Rewrite [CONTENT/CLAIM] as a series of 5-7 standalone sentences, each under 18 tokens, that: (1) make one complete, confident claim without requiring surrounding context; (2) include a specific data point or named mechanism where possible; (3) attribute the claim with "[Your Name/Brand] found/argues/shows that..." format. These will serve as AI-extractable citation anchors.
```

## Related
- [[concepts/ai-productivity-workflows]] — personal productivity with AI tools
- [[concepts/ai-content-creation]] — AI-assisted content generation strategies
- [[concepts/prompting-and-skill-design]] — crafting effective prompts and skills
- [[concepts/practical-agent-adoption]] — adopting agents in real workflows
- [[orgs/openai]] — referenced in model strategy, ChatGPT, and Codex discussions
- [[orgs/perplexity]] — AI search tool referenced in research workflow discussions

## Sources

- [[sources/05RRGiF7QC0]] — Master Perplexity Prompting
- [[sources/AoA9h3TjxE0]] — Why Every Cold Application You Send Is a Waste of Time (And What Actually Works)
- [[sources/DcnTK7E1Ayc]] — ChatGPT vs. Gemini vs. Claude Head-to-Head on Black Friday Deals: Prompts & Demo
- [[sources/IwQYVQ3MohE]] — AI Broke the Web: The 7 New Rules of the Game + Why YOU Have an Edge vs Big Companies
