---
type: llm
weight: 2
focus: { source: file, path: workflows/invoice-extract/evals/grader.md }
---

PASS if this grader file defines the judge as a list of yes/no checkable claims (each claim can be answered yes or no by looking at the output) and derives any verdict from those claims.
FAIL if it scores on a numeric scale such as 1-5 or 1-10, if it has no explicit claims, or if the file is empty or missing.
