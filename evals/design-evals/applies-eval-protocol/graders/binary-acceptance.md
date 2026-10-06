---
type: llm
focus: { source: file, path: workflows/invoice-extract/evals/acceptance.md }
---

PASS if every acceptance criterion in this file is a binary pass/fail rule an independent reviewer could check without asking the author, AND at least one criterion checks that the total matches the invoice's grand total exactly.
FAIL if any criterion depends on taste ("looks good", "clear", "high quality"), or if no criterion checks the total exactly, or if the file is empty or missing.
