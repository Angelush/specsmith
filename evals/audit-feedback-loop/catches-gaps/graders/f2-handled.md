---
type: llm
weight: 2
focus: { source: file, path: workflows/refund-bot/audit.md }
---

PASS if this audit table has a row for F2 (duplicate refund of an already-refunded order) AND that row either points to a newly added constraint / acceptance criterion / task that prevents double refunds, or is marked GAP.
FAIL if F2 is missing from the table, or if F2 is marked INCLUDED while pointing only to M1, M2, E1, AC1, or AC2 (none of which prevent double refunds).
