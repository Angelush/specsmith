# The bundled knowledge base (`knowledge/kb/`)

Specsmith is **grounded** in a knowledge base — an AI-educator wiki distilled from the public work of **Nate B. Jones** (48 concept pages, 270 source-video pages, ~300 traceable entry IDs). It ships **bundled** in this repo at [`knowledge/kb/`](kb/), so every skill is source-grounded out of the box with no setup.

The raw video transcripts the wiki was distilled from are **not** included — only the curated, attributed wiki (concepts + source summaries + people/orgs). That keeps the repo small and the provenance clean while still giving each skill the cited insight and its Use-when / Do-not-use-when boundary.

This is the "open brain" pattern (Axiom 8): the knowledge layer is portable and ownable. It lives beside the skills so you can read it, extend it, or swap it for your own wiki that follows the same conventions.

## Where it lives / pointing somewhere else

By default the KB is `knowledge/kb/` (the directory that contains `concepts/`, `sources/`, `index.md`). A skill resolves the KB root in this order:

1. `$SPECSMITH_KB` — set this to override with your own wiki:
   ```bash
   export SPECSMITH_KB="/absolute/path/to/your/wiki"
   ```
2. `knowledge/.kb-path` — a one-line file holding an absolute path (gitignored):
   ```bash
   echo '/absolute/path/to/your/wiki' > knowledge/.kb-path
   ```
3. the **bundled** `knowledge/kb/` (the default — always present).
4. the eight-axiom fallback in [`principles-core.md`](principles-core.md), used only if `knowledge/kb/` is removed.

## How skills use it (the grounding contract)

Every worker skill opens with a **"Ground this step first"** section naming the `concepts/<slug>.md` pages relevant to that step (paths are relative to the KB root above). The skill:

1. Reads those concept pages from `knowledge/kb/`.
2. Quotes the **Key insight** (each is cited to a source video) and pulls the entry's **Use-when / Do-not-use-when** boundary.
3. Refuses to recommend a pattern whose "do not use when" matches the user's situation.

If `knowledge/kb/` is ever absent, the skill uses the matching **Axiom** in `principles-core.md` instead. Same principle, lower resolution.

## Verifying a citation exists (don't cite what isn't there)

Entry IDs use category prefixes (`PRM` prompting, `AGD` agent-design, `FWK` framework, `CRR`/`CAR` career, `MND` mindset, `DVH` dev-hack, `MSL` model-selection, `TUL` tool, `PRN` principle, `TRD` trend, `WFL` workflow), each `-NNN`. Verify before relying on one:

```bash
KB="${SPECSMITH_KB:-knowledge/kb}"

# list every entry ID actually present in the KB
grep -rhoE '\b(PRM|AGD|FWK|CRR|CAR|MND|DVH|MSL|TUL|PRN|TRD|WFL)-[0-9]{3}\b' "$KB/concepts/" | sort -u

# confirm a specific source-video page exists before citing `sources/<id>`
ls "$KB/sources/<video_id>.md"
```

Newer KB ingests cite some insights by **bare `sources/<video_id>`** without assigning an entry-ID code — cite those by video ID. **Only cite IDs/sources that exist.**

## Attribution

The wiki distills the public work of **Nate B. Jones** — YouTube [@NateBJones](https://www.youtube.com/@NateBJones) ("AI News & Strategy Daily"), Substack [natesnewsletter.substack.com](https://natesnewsletter.substack.com/), site [natebjones.com](https://www.natebjones.com/). Each source page carries the original video ID; go watch the source. The distillation and any errors in it are the maintainer's, not his.
