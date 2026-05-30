# Nate Wiki — Agent Instructions

This is an LLM-curated wiki of knowledge extracted from Nate (AI educator) YouTube transcripts. It replaces the legacy monolithic `MASTER_INDEX.md` (now archived in `backups/`).

## Structure

```
knowledge/kb/        # THIS directory — the published wiki, bundled in the Specsmith repo
  AGENTS.md          # this file — schema, conventions, workflows
  index.md           # catalog of all wiki pages, grouped by category
  log.md             # append-only ingest/query/maintenance log
  concepts/          # one page per concept or theme (the core wiki)
  sources/           # one page per source video, keyed by 11-char video ID
  people/            # one page per recurring person (Nate, etc.)
  orgs/              # one page per recurring org/company (Walmart, JP Morgan, …)
```

Raw inputs (transcripts, manifest, playlist scrapes) and the build scripts live **outside this wiki** in the repo's gitignored `.kb-pipeline/` folder (local-only, never published). This wiki is a derived, regeneratable artifact; only it is committed.

## Page format

Every wiki page is markdown with YAML frontmatter:

```yaml
---
title: <human title>
type: concept | source | person | org
slug: kebab-case-slug
tags: [tag1, tag2]
sources: [video_id_1, video_id_2]    # concept pages only — videos this synthesizes from
stability: evergreen | evolving | volatile   # concept pages only
updated: YYYY-MM-DD
---
```

### Concept pages (`concepts/<slug>.md`)

Synthesize the *idea*, not the raw entries. Structure:

1. **One-paragraph definition** — what the concept is, in plain language.
2. **Why it matters** — the strategic / practical case.
3. **Key insights** — bullet list, each citing the source video(s) that contributed it via `[[sources/<vid>]]` wikilinks.
4. **Prompt commands** (when applicable) — ready-to-paste prompts copied verbatim from the source entries, each labeled with the originating entry ID.
5. **Related** — wikilinks to other concept/people/org pages.
6. **Sources** — list of `[[sources/<vid>]]` videos covered.

### Source pages (`sources/<video_id>.md`)

One page per YouTube video. Body:

1. Metadata block (title, URL, playlists, transcript path).
2. **Concepts covered** — wikilinks to every concept page this video contributes to, with one-line takeaways.
3. **Notable quotes / hooks** (optional, only if memorable).
4. Provenance pointer to the raw transcript: `data/transcripts/<id>.txt` (lives in the local, gitignored `.kb-pipeline/`; not resolvable in the published repo — it records origin, not a live link).

### People / org pages

Short biographical / contextual pages used to disambiguate references. Link back to the concepts where the person/org is invoked.

## Wikilinks

Use `[[concepts/orchestration-layer]]`, `[[sources/-5zFZznthw0]]`, `[[people/nate]]`. Always relative to this wiki root (`knowledge/kb/`). Broken wikilinks are tolerated as TODO markers — lint will flag them.

## Categories (legacy index facets)

Entries originally came from twelve categories: PROMPTING, DEV_HACK, FRAMEWORK, TREND, TOOL, AGENT_DESIGN, MODEL_SELECTION, CAREER, BUSINESS_OPP, WORKFLOW, PRINCIPLES, MINDSET. These survive as `tags` on concept pages and as section groupings in `index.md`. A single concept usually spans multiple categories.

## Stability

- **evergreen** — durable principle; date-independent.
- **evolving** — directionally true but specifics change as tooling matures.
- **volatile** — tied to a specific model lineup / market snapshot; revisit each quarter.

## Workflows

### Ingest new video → wiki

Driven by the `/index-new` skill. Pipeline:

1. Diff playlists vs `.kb-pipeline/data/metadata/manifest.json` → list of new video IDs.
2. Fetch transcripts → `.kb-pipeline/data/transcripts/<id>.txt`.
3. **Extract** (LLM per transcript): produce candidate concept-page additions + a source page draft. Output goes to `.kb-pipeline/data/metadata/_pending_entries/<id>.md` (a structured proposal, not a finished wiki edit).
4. **Integrate** (LLM, single pass): for each pending video,
   - create/update `sources/<id>.md`,
   - append insights to existing `concepts/*.md` pages or create new concept pages,
   - update `index.md` if new concept pages were created,
   - append a `log.md` entry: `## [YYYY-MM-DD] ingest | <video title> | <id>`.
5. Delete `_pending_entries/` after successful integration.

### Query → answer

When the user asks a knowledge question:

1. Read `index.md` to find candidate concept pages.
2. Read the relevant concept pages.
3. Answer with inline citations of `[[sources/<vid>]]` wikilinks.
4. Append a `## [YYYY-MM-DD] query | <one-line summary>` line to `log.md` only if the query revealed a gap worth recording.

### Lint

Periodic health check:

- Orphan concept pages (no inbound wikilinks).
- Broken wikilinks.
- Concept pages with no `sources:` frontmatter or no source citations.
- Stale `volatile` pages older than 90 days.
- Append a `## [YYYY-MM-DD] lint | <summary>` line to `log.md`.

## When in doubt

- Prefer updating an existing concept page over creating a new one.
- Concept names should be **noun phrases** (`orchestration-layer`, not `using-orchestration-layers`).
- Cite every claim. If you can't cite it, leave it out.
- Migration notes live in `log.md`, not inline in pages.
