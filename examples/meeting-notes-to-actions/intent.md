# Intent

**Stated task:** "clean list of action items from meeting notes."
**Real objective:** a *trustworthy* hand-off list a reader can act on without re-reading the notes — owner + due date on every item, zero fabrication.

**Correctness contract:**
- Truthfulness: owners/dates must come from the notes; missing -> `OWNER?`/`DATE?`, never invented.
- Completeness: every commitment/decision in the notes becomes an item; nothing dropped.
- Tone/format: terse, scannable, one line per action.
- Speed-vs-precision: precision wins — a flagged gap beats a confident guess.
