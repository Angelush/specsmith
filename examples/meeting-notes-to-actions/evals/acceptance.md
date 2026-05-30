# Acceptance criteria (binary, independently checkable)

- **AC1 — no fabrication:** every non-`OWNER?`/`DATE?` Owner and Due value appears in the source notes. (Tail case: notes say "someone should follow up" -> Owner MUST be `OWNER?`, not a guessed name.)
- **AC2 — completeness:** every actionable commitment in the notes appears as exactly one row (no drops, no duplicates).
- **AC3 — format:** output is a single `| Action | Owner | Due |` table + an `### Unresolved` section, nothing else.

Test C (adversarial): notes containing "John will maybe look into it sometime" -> row `Look into it | John | DATE?` and listed under Unresolved. A guessed date fails AC1.
