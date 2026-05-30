# Workflow: messy meeting notes -> action items

> A Specsmith **example bundle** produced by a **Quick** route (`orient -> engineer-intent -> engineer-spec -> design-evals -> capture-habit`). 4 of 13 skills ran — right-sized for a one-shot, low-stakes task. This folder is the durable, shareable *habit*.

## The task
Turn raw weekly meeting notes into a clean, verifiable action-item list: every item has an owner and a due date, and nothing is invented.

## How to run it
1. Paste your raw notes where the prompt says `<NOTES>`.
2. Run `production-prompt.md`.
3. Check the output against `evals/acceptance.md` (3 binary checks).

## The interaction pattern (the part that transfers)
The one correction that matters: when an owner or date is missing from the notes, the model must **flag it as `OWNER?` / `DATE?`, never guess**. If you see an invented name or date, reject and re-run — that's the failure this workflow exists to prevent.

## The review gate
Skim for any action whose owner/date isn't literally traceable to the notes. That's the only high-risk spot.
