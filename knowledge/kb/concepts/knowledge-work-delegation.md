---
title: Knowledge Work Delegation
type: concept
slug: knowledge-work-delegation
tags: [agent-deployment, expertise-elicitation, knowledge-extraction, workflow, scaling, documentation]
sources: [2PWJu6uAaoU, L32th5fXPw8, MFzxIT88zfg, PRqiGS6fnIM, jOWXBzP6nNg, IpEaSa7tgfc, ix8SsXjBc7M, NIRFVjttNvA, 1qGH6NwTj3o, 2w_vwQVvFmc, 7pqRRxrdr0c, avN5R3OhxYs, xqGCbEDbny8, wep2EQ9Y_Tc]
stability: evergreen
updated: 2026-11-03
---

# Knowledge Work Delegation

Knowledge Work Delegation is the strategic approach to offloading tasks that require significant cognitive effort, particularly by distinguishing the act of critical judgment from the process of documenting or translating that judgment. It involves effectively extracting and structuring human expertise to enable efficient delegation, especially to AI agents.

## Why it matters

Effectively delegating knowledge work is crucial for scaling individual and organizational expertise. It addresses the common bottleneck of translating expert judgment into actionable documentation, enabling professionals to multiply their impact without burning out or diluting their core expertise. By separating judgment from documentation and strategically eliciting tacit knowledge, it also empowers professionals to become more promotable and makes their unique expertise more enduring within an organization.

## Key insights

- **Expertise elicitation is foundational for effective agent deployment** — Before deploying a productive AI agent, invest in a specialized interview agent to extract tacit knowledge, which makes you better at delegating to both people and AI. [[sources/2PWJu6uAaoU]] (CRR-019)
- **The true bottleneck is the "translation layer," not expertise itself** — Many professionals spend significantly more time documenting or translating their expert judgments into deliverables than performing the actual expert task. AI can drastically reduce this translation effort. [[sources/L32th5fXPw8]] (WFL-010)
- **Separate judgment from documentation** — Quality control for expert tasks must remain with the human expert; AI's role is to handle the translation of those judgments into formatted outputs, not to make the judgments themselves. [[sources/L32th5fXPw8]] (WFL-010)
- **AI provides an 80/20 advantage in documentation** — AI can rapidly generate 80% of a professional deliverable, allowing experts to focus their efforts on the critical 20% that requires nuanced human touch. [[sources/L32th5fXPw8]] (WFL-010)
- **Structured context multiplies AI output quality** — Providing precise, templated, and structured context (task, client, draft expectations) significantly enhances the quality of AI-generated documentation. [[sources/L32th5fXPw8]] (WFL-010)
- **Expert elicitation creates a queryable database of operating systems** — A structured interview process documents how an expert works, creating a database that can inform productive agents and improve human delegation. [[sources/2PWJu6uAaoU]] (CRR-019)
- **Tacit knowledge can be extracted through structured questioning** — A 5-layer questioning approach (operating rhythms, recurring decisions, dependencies, friction points, judgment patterns) can effectively extract and document an individual's tacit knowledge. [[sources/2PWJu6uAaoU]] (CRR-019)
- **Why there is no push-button knowledge-work harness** — Deep knowledge work is contingent on domain knowledge ("reality has a surprising amount of detail"), so you must be deep enough in the context to custom-assemble the pieces; you cannot generically abstract a knowledge-work harness — like Luke Skywalker building his own lightsaber [[sources/MFzxIT88zfg]].
- **Judgment calls inside your own true expertise should stay with you — use AI as a sounding board, not the decider.** For tasks like which candidate to hire, what to name a product, or which direction a business should take, no frontier model can beat a genuine expert at the thing they are most expert in: even people who use frontier models daily and say the models make them better at their job describe the value as "a wall to bounce ideas off of," not a source of the final call. If you don't already have a strong instinct about what's correct and aren't willing to apply your own judgment, that's precisely the situation where deferring to the model produces a mistake — the model's instincts are not world-class enough to spot the unspeakable "this is the one" signal an expert reads off two equally-qualified candidates. The cheapest and most correct move in these cases is often to set the AI aside and type out your own answer [[sources/PRqiGS6fnIM]].
- **Coding harnesses are engineer-tuned; first-gen knowledge-work harnesses inherit that bias** — Claude Code and Codex feel ergonomically comfortable because engineers built them for engineers, but early knowledge-work harnesses (ChatGPT work, Anthropic cowork) are still built by engineers guessing what non-engineers need, which risks "dumbing down" a process that's actually about reaching a conclusion over time through judgment rather than code verification — a real product gap remains for a harness designed with non-technical input baked in from the start [[sources/jOWXBzP6nNg]].
- **Planning stays human, execution goes to the agent, and domain expertise drives steering** — In Anthropic's study of ~400k Claude Code sessions, humans made ~70% of planning decisions and agents nearly all execution decisions. Experienced users auto-approved more but interrupted more often (~9% of turns vs ~5% for novices), and expert-led sessions averaged ~12 agent actions per instruction vs ~5 for novices: knowing the problem beats knowing how to code. The human skill set is picking finishable work, supplying files and permissions, stating what good looks like up front, knowing when to stop the run, and fixing recurring mistakes. [[sources/IpEaSa7tgfc]]
- **Hand the model the whole outcome, not a prompt-sized piece** — The shift mirrors Claude Code in December: before, you asked for pieces (a checklist, a draft email) and iterated; with a model that can move across docs, maps, websites, email and calendar, keep choosing next steps, route around bad sites and ask one question without abandoning six other pieces, you delegate hours-long chunks (a household move has 20+ hours of admin). Contained, task-shaped jobs (find and verify doctors from their own sites) already work on cheaper models; the new tier is entangled, dependency-heavy work. Ask per job: can the model just take this, does it need a supervisor, what card does it need, which choices stay mine [[sources/ix8SsXjBc7M]].
- **Recipe cards: the post-prompt delegation artifact** — A master prompt cannot carry a week-long job, and nobody will write a 14-part spec and approval matrix before a move. A recipe card is a readable, adjustable map: it names the real job and sketches the sub-jobs, tells the manager what to ask you, what information and access agents need, what they can do without interrupting, what runs in parallel, what must come back, which actions need approval, and how to proceed when things break (failed login, missing document, conflicting sources, blocked site). Paste into any manager agent, which interviews you and starts [[sources/ix8SsXjBc7M]].
- **Humans keep the irreversible, risky, responsible decisions** — Delegating the grunt work (research, comparison, option development) means the human's job narrows to choices: the agent can research homes but you pick the house. Rather than inserting a human at every step, bring the person back to the choice, risk and responsibility, and have the agent surface what is irreversible about each option. Expect more decisions per person as agents widen the option set, and explicitly tell the agent to keep decisions that should be yours yours [[sources/ix8SsXjBc7M]].
- **Assign the check, not the polish** — Once you know what the human must do with a result, aim agent capability at the step they have to trust: a painting contractor caught Claude pricing a bid from a floor-area multiplier instead of real wall measurements and now asks it to show its work on exactly that calculation; a more polished proposal would have been "worse than useless." A good second-agent assignment is verification — check the evidence behind the recommendation, find the assumption that would change the answer, resolve what you would otherwise investigate yourself [[sources/NIRFVjttNvA]].
- **Hand over standing areas of concern, not task-shaped asks** — Long-running agents can own assignments with no natural end ("keep this customer account healthy", "keep me aware of what I'm likely to miss", "watch this research question and tell me how to think about the decision coming"). Such a spec must say what the agent remembers, how it decides a new event matters, and when it returns unprompted; a one-shot task spec has none of these, so the job shape (ongoing, evolving, problem shape not fully understood) has to be written into intent rather than left implicit [[sources/1qGH6NwTj3o]].
- **Seven pre-handoff questions for a standing agent job** — Before giving an agent a persistent role, answer: what part of my world am I handing over, what may it read and remember, where can it start without me, what can it promise on my behalf, who or what is watching it, will they correct it, and how do I know. These map directly onto spec sections (scope, memory permissions, autonomy boundary, commitments, oversight). Also scope by stakes: the agent must reliably tell a $10 decision it can take from a car-sized one it escalates, especially for anything touching time, money or relationships [[sources/1qGH6NwTj3o]].
- **Task imagination: look for jobs nobody has written down** — Distinct from delegating tasks already in your tracker, the skill is spotting dirty, ambiguous, unowned work that felt too big for AI (fact-checking a 500-page board packet, deduplicating and briefing 2M CRM records reproducibly, mining 40,000 reviews). Prompt-sized asks make all frontier models feel alike, so the test of a Fable-sized job is that it lifts a tangible, painful load once finished [[sources/2w_vwQVvFmc]].
- **Big-job recipe: data pack, done paragraph, walk away, review as owner** — Spend hours assembling the source material (a 3-4 hour prep that saves two weeks is worth it), write one clear paragraph on what should exist at the end, give rough guidelines for judgment calls, then leave it alone; hovering is a habit trained on small models. Afterward review scope, angle and correctness like an owner reviewing a senior's work and assign revision work for gaps. A reviewable trail is a required part of the spec [[sources/2w_vwQVvFmc]].
- **Use a ticket as a scaffold the agent pre-fills with research** — Give each recurring pain its own ticket and have AI attach the billing lookup, account state and prior conversations, so the human opens it, sees everything, and only actions it. That cut a 5-10 minute undirected research task to under a minute (about 90% of mental load by the operator's estimate) while humans kept approval on every decision involving access or money. Across the backlog the team found 26 patterns, each worth its own SOP with the most painful research step targeted for AI [[sources/7pqRRxrdr0c]].
- **Tell the agent which source wins when documents disagree, then make it show an evidence tree** — Give the assignment the account plan, the customer commitment and the relevant service records, and state which source takes priority on conflict (most people never do). Ask it to link evidence for the claims that matter, then open the links: does the source really say "resolved," and is it this week's update or last month's plan? When the answer is weak, check what information the tool actually had (unconnected system, missing permission) before concluding the model cannot do it; a missing source is a specific thing to fix or raise with IT [[sources/avN5R3OhxYs]].
- **Make a working assignment recur only with explicit triggers, thresholds and contact limits** — Once a result is good enough to use, decide what triggers the next run and what the agent owns between check-ins: which accounts it checks, how often, what counts as a material change, when it brings you in, and whether it may contact anyone or only prepare drafts (start draft-only). Then inspect the next run: did it notice what changed, or just re-summarize what you already knew? Repeating a weak assignment only multiplies weak output [[sources/avN5R3OhxYs]].
- **A first delegation loop needs five things: goal, sources, standard, permission boundary, proof of done** — Not a fancy prompt: a real assignment ("read these sources, produce this artifact, check it against the standard, do not stop at the first plausible draft") with real sources and a way to check the result. Start with one annoying, valuable loop (transcript to brief, organize a source folder, prepare the day from calendar, email and Slack, draft three versions and explain the differences, check a package and say what is missing) rather than automating your whole life [[sources/xqGCbEDbny8]].
- **Automate the drudgery, not the performance of work** — Agents imitating Slack/Teams archives produce "nothing to report" standups: an expensive simulation of work. Agent value is in repeatable, high-drudgery work redesigned as read data -> process -> emit a defined format, with no human conversational medium (email, chat, meetings) in the loop [[sources/wep2EQ9Y_Tc]].

## Prompt commands

### Expertise elicitation interview — `CRR-019`
```
Run an expertise elicitation interview for your role: (1) What does a typical day, week, month actually look like (not the calendar version)? (2) What recurring decisions do you make, and what inputs do you need for each? (3) Who do you depend on, and when do you need them? (4) What recurring tasks or annoyances eat your time? (5) What judgment calls do you make instinctively, and how would you teach someone to make them?
```

### Professional deliverable generation from expert assessment — `WFL-010`
```
I'm a [PROFESSION] and just finished [SPECIFIC TASK/OBSERVATION]. Here's my raw expert assessment (voice memo transcript / bullet notes): [PASTE]. Please convert this into a professional [ESTIMATE/BRIEF/REPORT/CHART NOTE] for a [CLIENT/EXECUTIVE/PATIENT] audience. Tone: no jargon, emphasize [WHAT CLIENT CARES ABOUT]. Formatting: [DESIRED FORMAT]. Do not invent details I haven't provided — flag any gaps with [NEEDS INPUT].
```

### household-move-recipe-card-short
```
I need to move my household to X city by Y date. I don't want to lose a week of my life to forms or two weeks. Please start this task by showing me which parts of the move you can handle completely. Ask me about who's moving, about the budget, about the kind of home that I'm going to move to, about schools, doctors, vehicles, pets, utilities, anything else that might change that job. And then I want you to manage the work. You handle the research, the comparison, the appointments, the form prep, and you use other agents when that helps you get the job done. Your job is to keep working on parts that aren't blocked. Your job is to bring me the choices or approvals that still need me. Do not make me manage the step by step. You are the central point of contact for this task.
```

## Related
- [[concepts/semantic-engineering]] — engineering discipline for probabilistic AI
- [[concepts/ai-job-market-dynamics]] — AI impact on hiring and job markets
- [[concepts/ai-career-skills]] — skills for career success in the AI era
- [[concepts/practical-agent-adoption]] — adopting agents in real workflows

## Sources

- [[sources/2PWJu6uAaoU]] — The Real Problem With AI Agents Nobody's Talking About
- [[sources/L32th5fXPw8]] — The AI Expertise Bottleneck: How Top 1% Pros Are Scaling Faster Than Ever
---
strategic_intent: I have successfully created the concept page in Markdown format as requested by the user. I have followed all the output requirements and rules.
- [[sources/MFzxIT88zfg]] — I Built a Deck With AI, Then Made a Second AI Attack It.
- [[sources/PRqiGS6fnIM]] — 1.6M agents registered for OpenClaw and did NOTHING.
- [[sources/jOWXBzP6nNg]] — Your Next AI Subscription Shouldn't Be ChatGPT 5.6 Or Fable 5. It Should Be Both.
- [[sources/IpEaSa7tgfc]] — Agents Aren't Taking Your Jobs. They're Creating More Work Instead.
- [[sources/ix8SsXjBc7M]] — There Are Jobs You Could Never Give AI. I Gave GPT-6 Astra 20 Hours Of Admin.
- [[sources/NIRFVjttNvA]] — productivity draft
- [[sources/1qGH6NwTj3o]] — GPT-6 Astra Doesn't Need Your Instructions Anymore.
- [[sources/2w_vwQVvFmc]] — The Doing Got Cheap. Now What? | Claude Fable 5 Changes Work
- [[sources/7pqRRxrdr0c]] — I Gave An AI Agent My Support Inbox. It Cut The Work By Two-Thirds.
- [[sources/avN5R3OhxYs]] — OpenClaw Was Too Dangerous To Install. 7 Months Later Microsoft Is Bringing It To Your Company.
- [[sources/xqGCbEDbny8]] — Codex Tutorial: Build Your First AI Agent Delegation Loop
- [[sources/wep2EQ9Y_Tc]] — Google Has More Data Than Almost Anyone. So Why Is It Bidding $10 Million On Old Emails?
