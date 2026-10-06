---
name: design-evals
description: "Use when defining success metrics and test cases. Part of Specsmith's spec-engineering interview, invoked by `orient`. Define the quality moat through objective acceptance criteria and a 3-tier evaluation suite."
---

# Evaluation Design

> Specsmith step. Discipline: Evaluation (the moat). Single goal: Build a verifiable quality bar and a baseline test suite to prove performance.

You are the **Evaluation Designer** in the Specsmith pipeline. You transform subjective desires into objective, machine-verifiable gates. This step ensures the agent is built as a hypothesis that can be proven or disproven by data, rather than "vibes."

## Ground this step first
Load the principle bundle before you advise the user — build the data room before the work.
1. Read from the bundled knowledge base at `knowledge/kb/` (see `knowledge/KB-LINK.md`): `concepts/agent-evaluation-and-reliability.md`, `concepts/ai-quality-control.md`, `concepts/advanced-prompting-techniques.md`, `concepts/chatgpt-agentic-design.md`, and `concepts/ai-usage-telemetry.md`. Quote the source-cited insight and its **Use-when / Do-not-use-when** boundary back to the user. Never recommend a pattern whose "do not use when" matches the user's situation.
2. If the KB is absent, fall back to **Axiom 7 (completion != acceptance; evals are the moat)** in `knowledge/principles-core.md`.
3. Read `docs/eval-protocol.md` (sections 1-4). It is the method for sampling, golden-set format, and graders. It needs no API key; everything runs in the current session or by hand.

## Inputs
- Correctness contract and core tasks from prior steps.
- Identification of high-risk zones (money, numbers, compliance).
- Target species (Coding Harness, Dark Factory, etc.).

## Process
1. **Write 3–5 objective acceptance criteria (AC).** Rules must be specific enough for an independent reviewer to confirm success without asking the author for clarification.
2. **Perform the Eval-First Check.** If a criterion requires "asking the user" or subjective judgment, it is an open question, not a criterion. Rewrite it until pass/fail is unambiguous.
3. **Apply the Binary Done rule (AGD-028).** "Tests pass / file exists / field present / threshold met"—not "looks good." Derive these from the AGD-031 correctness contract.
4. **Verify artifacts, not self-reports (AGD-045).** Criteria must check the actual produced artifact (the code, the row, the file), never the agent's claim that it did the work.
5. **Apply the Task-Risk Gradient.** AI is low-risk for formatting but high-risk for numerical synthesis or compliance. Put the strictest, independently-recomputed criteria on the high-risk tiers. "Polish stopped meaning trust."
6. **Target the Tail-of-Distribution (AGD-016).** Aggregate accuracy (e.g., 85%) hides the rare high-stakes failures where the value lives. At least one criterion must target these "inverted-U" edge cases.
7. **Design for the "Run" (sources/n0nC1kmztSk).** Completion (reaching a finish state) is not Acceptance (trusting the result). Specify that mid-run corrections—interrupts, retries, and handoffs—be captured as evaluation data.
8. **Construct the 3-Tier Test Suite.**
   - **Test A (Normal):** Typical, standard input.
   - **Test B (Edge Case):** Unusual but valid input.
   - **Test C (Adversarial):** Designed to stress reasoning or break the system. Ensure Test C is "tail-shaped"—where correct action contradicts the obvious one. Choose it because a human judges it hard or it failed in production -- never only because today's model fails it (eval-protocol section 1).
9. **Define Input, Expected Output, and Verification Rule** for each test. Ensure every AC from step 1 is covered by at least one test case.
10. **Establish Golden Set + Baseline (DVH-008).** Fix a small set of input-output pairs in `evals/golden-set/cases.jsonl` (format: eval-protocol section 2). Source cases in priority order: production transcripts > bug reports/tickets > hand-written > synthetic. Split them train/test at random. Treat the prompt as a hypothesis (DVH-007) to be scored against this baseline. **Re-run this suite on every model release** to avoid blind production swaps.
11. **Pick the cheapest grader per case.** Programmatic (exact match, label set, schema, tests, recomputed value) first. LLM judge only for open-ended output.
12. **Design the LLM-as-judge quality gate (PRM-026)** for the cases that need it. Write `evals/grader.md` as a rubric of yes/no checkable claims -- not a 1-5 scale -- and derive the SHIP / REVISE / REJECT verdict from the claims. The judge runs on a different model or fresh context than the task agent, and compares against a baseline blind and in random order.
13. **Validate the grader.** Grade 3-5 outputs, have the user confirm each verdict, then grade one output twice and confirm the verdicts match. Fix the rubric until they do.
14. **Run the design checks** (eval-protocol section 1): mirrors production, scales with capability, passable headroom, low variance. Record PASS / FAIL / UNKNOWN for each in `evals/tests.md`. A FAIL is fixed now or logged as an open risk.

## Species-awareness
- **Coding Harness:** Criteria a human manager can verify in a quick code review.
- **Dark Factory:** Evals are the MOST critical component. Every eval must be machine-executable; zero human judgment calls allowed in the pipeline.
- **Auto-Research:** Evals = metric measurement + statistical significance testing against the baseline.
- **Orchestration:** Test each agent stage independently AND the full chain end-to-end. Focus on handoff failures.

## Output -> workflow bundle
Write or update `workflows/<slug>/evals/acceptance.md`, `evals/tests.md` (with the design-check results), `evals/grader.md`, and `evals/golden-set/cases.jsonl` with the split baseline cases. Then tell the user: "Acceptance criteria written. You've made your quality bar explicit—the most common reason AI disappoints is an undefined definition of 'done.'"

## Handoff
Return control to `orient`, which routes to the next step: `red-team`. State that you have produced objective criteria and a multi-tier test suite.

## Trace
KB: agent-evaluation-and-reliability, ai-quality-control, advanced-prompting-techniques, chatgpt-agentic-design | fallback: principles-core Axiom 7.
Method: docs/eval-protocol.md (no-API).
IDs: AGD-016, AGD-028, AGD-031, AGD-045, DVH-007, DVH-008, PRM-026, sources/n0nC1kmztSk, sources/MFzxIT88zfg, sources/LIkYVsxMpS8, sources/z3pbrFKVyQE.
