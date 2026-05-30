---
title: Agent Evaluation, Failure Modes, and Reliability
type: concept
slug: agent-evaluation-and-reliability
tags: [agent-design, failure-modes, evaluation, reliability, workflow-automation, prompt-optimization]
sources: [-oI7mrudRn8, 4cuT-LKcmWs, iG_CCjdyeX0, tJB_8mfRgCo, 61IJSZ6GOuU, 6Q76EnHVRms, 0jSE0NABcY8, n0nC1kmztSk]
stability: volatile
updated: 2026-05-29
---

# Agent Evaluation, Failure Modes, and Reliability

Agent Evaluation, Failure Modes, and Reliability encompasses understanding and mitigating common ways AI agents fail, establishing clear metrics for their success, and building robust systems to assess their performance. This includes identifying specific error patterns like context degradation or self-report hallucination, and implementing strategies for continuous improvement and verification.

## Why it matters

Focusing on agent reliability and understanding failure modes is crucial for deploying effective AI agents that deliver real business value. By prioritizing workflow completion rates, rapidly iterating with 85% solutions, and building in verification steps, organizations can achieve compounding value from automation and avoid significant costs associated with flawed agent deployments. Early identification of quality standards and explicit negative examples also helps accelerate AI learning and ensures alignment with organizational goals.

## Key insights

-   **Measure success by workflow completion rate, not feature count** — Focus on agents achieving 90%+ correct completion of high-frequency, high-cost, low-ambiguity workflows to maximize ROI and avoid early discouragement. [[sources/-oI7mrudRn8]] (AGD-003)
-   **Prioritize velocity over perfection in early agent deployments** — Shipping an 85%-complete agent in 6 weeks generates more value and accelerates teams more than waiting 6 months for a perfect system, especially for workflows with a high "blast radius." [[sources/-oI7mrudRn8]] (AGD-006)
-   **Audit agents against common failure patterns before deployment** — Be aware of context degradation, specification drift, sycophantic confirmation, tool selection errors, tail failures, and reasoning-output disconnect to prevent deployment-breaking issues. [[sources/4cuT-LKcmWs]] (AGD-015)
-   **Agent self-reports can be hallucinatory; always independently verify actual output** — Agents may claim to have processed files or completed tasks they never touched, making independent verification of artifacts (e.g., files written, database entries) essential for trust and reliability in agentic pipelines. [[sources/tJB_8mfRgCo]] (AGD-045)
-   **Utilize "failure tests" to rapidly define quality standards for AI outputs** — Providing 5-7 explicit examples of undesirable outputs with reasons for rejection helps AI understand boundary conditions and learn quality floors faster than positive examples alone. [[sources/61IJSZ6GOuU]] (DVH-006), [[sources/61IJSZ6GOuU]] (FWK-019)
-   **Implement workflow-shaped evaluations (e.g., Ralph Wiggum pattern) to force agent convergence on correctness** — Use stop-hooks and binary, machine-verifiable completion criteria to prevent premature declarations of "done" and ensure agents iterate until tasks are verifiably complete. [[sources/iG_CCjdyeX0]] (AGD-028)
-   **Treat prompts as hypotheses and employ automated prompt optimization (DSPI) to find the best performing variants** — Instead of fixed instructions, continuously test and score different prompt variants against ground-truth examples and a scoring rubric to maximize output quality at scale. [[sources/6Q76EnHVRms]] (DVH-007)
-   **Organizational clarity, not model capability, is often the bottleneck in AI writing quality** — AI amplifies ambiguity, so explicitly defining quality standards, business logic, and desired voice through failure tests and structured prompts is critical for achieving high-quality AI-generated content. [[sources/61IJSZ6GOuU]] (FWK-019)
-   **Integrate AI development with browser tools to tighten the debug-fix loop** — Connecting tools like Claude Code with browser extensions allows agents to inspect DOM, console logs, and multi-tab workflows, reducing context-switching during web application debugging. [[sources/0jSE0NABcY8]] (DVH-001)
- **Agent analytics: the run is the unit; completion != acceptance** — When the user is an agent, the unit of product behavior is the agent run (not clicks/sessions, and not developer traces): completion (task reached a finish state) is distinct from acceptance (the user trusted the result), and the 2x2 between them gates how much autonomy to grant. Mid-run corrections (interrupts, edits, denied approvals) are effectively evals — "interruptions, retries, and handoffs are the new clicks" — so ship three events (run start, task complete, mid-run shaping) tied to one run ID [[sources/n0nC1kmztSk]].

## Prompt commands

### Analyze business workflow for automation readiness — `AGD-003`
```
Analyze the following business workflow for AI agent automation readiness: [WORKFLOW]. Evaluate: (1) frequency and cost impact, (2) input definition clarity (defined vs. ambiguous), (3) tool callability, (4) expected first-month completion rate, (5) edge case density. Recommend whether to automate now or after simplification.
```

### Identify highest-blast-radius agent deployment opportunity — `AGD-006`
```
Identify the highest-blast-radius agent deployment opportunity for [TEAM/ORG]: (1) List the top 5 workflows by frequency × pain level × number of teams affected. (2) For each, estimate: can an 85%-accurate agent be shipped in 6 weeks? (3) What is the cost of waiting 6 months for 100% accuracy vs. deploying now at 85%? (4) Recommend the single workflow to automate first based on blast radius and feasibility.
```

### Audit against 6 failure modes — `AGD-015`
```
Before deploying an agent, audit against these 6 failure modes: (1) Is context window managed/compacted over long sessions? (2) Is the spec re-injected at intervals? (3) Are data inputs validated before the agent touches them? (4) Are tools few, well-named, and correctly framed? (5) Is evaluation checking tail performance (not just average accuracy)? (6) Are reasoning traces compared against final outputs for divergence?
```

### Set up convergence loop for agent task — `AGD-028`
```
Set up a convergence loop for [AGENT TASK]: (1) Define "done" in binary, machine-verifiable terms (tests pass, file exists, criteria met). (2) Add anti-completion-hallucination instruction: "Do not declare success until [VERIFICATION CRITERIA] are all met. If any fail, identify what failed and continue." (3) Measure convergence efficiency: iterations to green state per cost budget. (4) If using Claude Code, configure a stop-hook that re-injects the original prompt when the agent tries to declare done prematurely.
```

### Verify agent workflow completion with artifacts — `AGD-045`
```
After [AGENT WORKFLOW] completes: (1) Pull the actual artifact inventory (files written, rows inserted, records created) from the ground-truth store — not from the agent's report. (2) Diff agent's claimed completion list against actual artifact list. (3) Flag any item the agent claims to have handled that has no corresponding artifact. Do not proceed to downstream steps until this diff is clean.
```

### Improve output quality with negative examples — `DVH-006`
```
Here are [N] examples of outputs I would REJECT for [TASK], with the specific failure reason for each: [list]. Use these as the floor — anything that resembles these in the listed dimension is wrong. Now produce [DESIRED OUTPUT].
```

### Run prompt optimization for task — `DVH-007`
```
Run a prompt optimization for [TASK]: (1) Here are 3 input/output pairs showing the quality I want: [pairs]; (2) Here is my scoring rubric — what makes an output excellent vs. poor: [rubric]; (3) Generate 3 different prompt variants that would produce the outputs in my examples; (4) Test each variant against my input examples; (5) Score each output 1-5 on my rubric; (6) Recommend the winning prompt and explain why it outperformed the others.
```

### Debug web app with Claude Code in Chrome — `DVH-001`
```
Open the browser at [URL], inspect the DOM for [ELEMENT/ISSUE], check the console logs for errors, identify what's causing [BEHAVIOR], and propose a fix. Then apply the fix in the codebase.
```

### Define quality criteria for writing tasks — `FWK-019`
```
Before using AI for [WRITING TASK], define: (1) 5-7 examples of outputs you would REJECT and why (failure tests); (2) 3 examples of outputs you consider excellent and what makes them excellent; (3) explicit business logic embedded in your structure (what order, what sections, what length says about your values); (4) your distinctive voice markers vs. the AI default voice. Give all 4 to the model before asking for output.
```

## Related
- [[concepts/practical-agent-adoption]] — adopting agents in real workflows
- [[concepts/agent-orchestration-architecture]] — orchestrating multi-step agent pipelines
- [[concepts/multi-agent-system-design]] — coordinating multiple specialized agents
- [[concepts/ai-security-and-trust]] — safety and permission models for agents

## Sources

-   [[sources/-oI7mrudRn8]] — Fortune 100 AI Agent Secrets: The 6 Principles
-   [[sources/4cuT-LKcmWs]] — The AI Job Market Split in Two. One Side Pays $400K and Can't Hire Fast Enough.
-   [[sources/iG_CCjdyeX0]] — Why "Pretty Good on First Pass" Is Costing You Thousands--How To Fix It TODAY
-   [[sources/tJB_8mfRgCo]] — Your Prompts Didn't Change. Opus 4.7 Did.
-   [[sources/61IJSZ6GOuU]] — I Spent 200 Hours Teaching AI Writing—6 Principles Everyone Gets WRONG
-   [[sources/6Q76EnHVRms]] — I Found the Easiest Way to Build Self-Optimizing AI Prompts (DSPI)
-   [[sources/0jSE0NABcY8]] — Claude Code Snuck in 7 Updates in 2 Weeks
- [[sources/n0nC1kmztSk]] — A Cursor Agent Wiped a Database in 9 Seconds. Agent Analytics Would Have Seen It Coming.
