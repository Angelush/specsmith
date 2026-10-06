---
type: llm
weight: 2
focus: { source: file, path: workflows/refund-bot/audit.md }
---

PASS if the audit flags optimization round R2 as a problem: its test-set gain (0.78 -> 0.80, +0.02) is below the test noise floor (0.07), so it should not have been KEPT or adopted as the best configuration.
FAIL if R2 is not mentioned, or if it is accepted as a valid kept patch.
