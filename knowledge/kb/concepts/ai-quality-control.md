---
title: AI Quality Control and Taste
type: concept
slug: ai-quality-control
tags: [ai-quality-control, taste, domain-expertise, articulation, encoding, institutional-knowledge]
sources: [-FhtPUkXKO4, 5Di6o6zuMLc, A_Lv0Ze272g, 2PWJu6uAaoU, MFzxIT88zfg, ltbzgzZZmgI]
stability: evergreen
updated: 2026-05-29
---

# AI Quality Control and Taste

AI Quality Control and Taste refers to the crucial skill of evaluating AI outputs, defining the subjective yet experienced-driven "taste" of quality, and encoding this institutional knowledge for reliable quality assurance. It focuses on the human ability to recognize, articulate, and systematize feedback on AI-generated content to ensure it meets specific standards and contributes to long-term organizational value.

## Why it matters

As AI becomes more sophisticated, generating plausible but often flawed outputs, the ability to discern and reject incorrect or sub-optimal results is more valuable than mere generation speed. This process transforms subjective judgment into actionable constraints, improving both current AI performance and future institutional knowledge. By mastering AI quality control, organizations can maintain distinctive standards, leverage human expertise more effectively, and avoid the pitfalls of tacit knowledge that can hinder AI delegation, especially for senior experts.

## Key insights

- **AI rejection is a core skill** — The ability to recognize and articulate *why* AI output is wrong is more valuable than fast generation, as it compounds institutional knowledge when shared. [[sources/-FhtPUkXKO4]] (FWK-002)
- **Three sub-skills of AI rejection** — Effective AI rejection involves recognizing the flaw (requiring domain experience), articulating *why* it's wrong (producing a reusable constraint), and encoding this constraint into systems or prompts for future use. [[sources/-FhtPUkXKO4]] (FWK-003)
- **Taste has two architectures** — Quality standards comprise delegatable, codified rules (Architecture 1) and a human-owned "quality without a name" (Architecture 2) that ensures coherence and vision in AI-generated products, which agents cannot yet replicate. [[sources/5Di6o6zuMLc]] (FWK-012)
- **"Good taste" is the universal AI-era skill** — Accumulated domain experience, or "taste," is the primary human leverage against AI, enabling experts to precisely push back on model outputs and demand useful, not just plausible, work. [[sources/A_Lv0Ze272g]] (MND-003)
- **Expertise compression creates a structural trap** — Senior expertise often becomes tacit and difficult to articulate, making it challenging to delegate to AI agents even though these experts would benefit most from such leverage. [[sources/2PWJu6uAaoU]] (PRM-028, FWK-040)
- **Four-stage office-doc pipeline + task risk gradient** — Serious AI office work needs a four-stage pipeline (prepare sources -> produce a file spec/structure -> constrained creation -> hostile verification) and a task risk gradient (AI is low-risk for formatting/summaries, medium for source attribution, highest for numerical synthesis, financial calcs, and compliance language) — because "polish stopped meaning trust": a model can look validated while a formula is wrong across every cell with no REF error [[sources/MFzxIT88zfg]].
- **Structural hallucination comes from the environment** — Organizational/structural hallucinations (e.g. Sullivan & Cromwell's fabricated court citations, despite top tooling) come from the messy environment around the model, not the model itself; the fix is a reviewed source-inventory table that makes the agent's judgment legible and acts as a clean review gate, not a sharper prompt [[sources/ltbzgzZZmgI]].

## Prompt commands

### Identify Contextually Wrong Claims — `FWK-002`
```
Review the following AI-generated [OUTPUT TYPE] and identify: (1) specific claims that may be technically correct but contextually wrong for our domain, (2) missing proprietary insight or domain-specific framing, (3) reasoning that sounds confident but would not survive expert review. For each issue, articulate a constraint that should be added to future prompts.
```

### Articulate and Encode Rejection — `FWK-003`
```
When you reject AI output, use this format to articulate and encode the rejection: WHAT WAS WRONG: [specific issue]. WHY IT MATTERS: [domain reasoning]. CONSTRAINT TO ADD: [rule in plain language that prevents this mistake]. EXAMPLE OF CORRECT OUTPUT: [brief example].
```

### Separate Taste Architectures — `FWK-012`
```
Separate my project's taste into two architectures: ARCHITECTURE 1 (delegatable) — list all codifiable rules, conventions, style guides, and patterns that agents can follow today. Write them as CLAUDE.md rules or system prompt constraints. ARCHITECTURE 2 (human) — list the coherence, vision, and "quality without a name" judgments that only I can make. For each Architecture 2 item, define a review checkpoint where I evaluate agent output against my taste before it ships.
```

### Apply Taste Explicitly — `MND-003`
```
When reviewing AI output on [TASK], apply taste explicitly: (1) What specifically is working? Name it. (2) What specifically feels hollow, overdramatic, or wrong? Name it. (3) What would a person with 10 years in this domain change? (4) Tell the model: "I like [specific element]. Change [specific element] because [specific reason]. If you need more information rather than guessing, ask me." Push back until the output reflects your standards, not the model's defaults.
```

### Inventory Tacit Knowledge — `PRM-028`
```
Inventory your own tacit knowledge: (1) What decisions do you make without thinking through steps? (2) For each: can you reconstruct the reasoning chain? (3) What pattern-matching happens in your head that you cannot fully articulate? (4) If you had to teach a junior person (or agent) your job, what would take the longest to convey?
```

### Map Cold-Start Problem — `FWK-040`
```
Map your cold-start problem against your level: (1) How much of your daily work is automatic pattern-matching vs. explicit steps? (2) If you had to break down your job for an agent, what would be hardest to articulate? (3) Where would agent leverage help you most (which 20% of work would free up 80% of your time)? (4) What is the minimum articulation work needed before an agent could help with that 20%?
```

## Related
- [[concepts/organizational-ai-transformation]] — transforming org structure with AI
- [[concepts/open-brain-systems]] — agent-readable institutional memory
- [[concepts/mcp-architecture]] — Model Context Protocol patterns
- [[concepts/ai-roi-and-value-proposition]] — evaluating AI tool ROI

## Sources

- [[sources/-FhtPUkXKO4]] — Stop accepting AI output that "looks right."
- [[sources/5Di6o6zuMLc]] — The Builders Who Figure This Out First Will Be Impossible to Catch
- [[sources/A_Lv0Ze272g]] — The Universal AI Skill: Good Taste
- [[sources/2PWJu6uAaoU]] — The Real Problem With AI Agents Nobody's Talking About
- [[sources/MFzxIT88zfg]] — I Built a Deck With AI, Then Made a Second AI Attack It.
- [[sources/ltbzgzZZmgI]] — The One AI Writing Hack Nobody Talks About.