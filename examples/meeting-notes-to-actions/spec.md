# Specification

- **Input:** free-text meeting notes (any length, messy).
- **Output:** markdown table `| Action | Owner | Due |`, one row per action, plus a short "Unresolved" list for items missing an owner or date.
- **Format:** markdown only; no preamble.
- **Scope (out):** does not summarize discussion, does not schedule, does not email anyone.
- **Compute profile:** Low (single prompt, fast model).

**Meaning layer**
- Invariant: every Owner/Due cell is either a value traceable to the notes or the literal token `OWNER?`/`DATE?`.
- Hazard: fabricating a plausible owner/date (the model's default helpfulness). Actively prevented by the invariant + an eval.
- Unstated constraint a human would assume: "next Friday" etc. should be resolved to an explicit date only if the note's date is known; otherwise `DATE?`.
