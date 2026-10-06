---
description: design-evals writes binary ACs, a split cases.jsonl golden set, and a checkable-claim grader instead of a 1-5 scale.
tags: [design-evals, protocol]
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit]
---

We are mid-way through a Specsmith session. The bundle slug is `invoice-extract`; write everything under `workflows/invoice-extract/` in the current directory.

Intent so far: an agent reads supplier invoices (PDF text already extracted) and outputs a JSON record with supplier_name, invoice_number, issue_date (ISO 8601), currency, and total. The correctness contract: total must equal the invoice's stated grand total to the cent, and when a field is missing or unreadable the agent must output null for it and add the field name to a `needs_review` list -- never guess. Stakes: these records feed accounts payable, so a wrong total means paying the wrong amount. Some invoices also carry a short free-text `notes_summary` field, which is open-ended.

Now run the evaluation-design step for this bundle. You have everything you need; do not ask me questions, make reasonable assumptions and note them.
