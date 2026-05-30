# Nate Wiki — Log

Append-only chronological log of ingests, migrations, queries (when noteworthy), and lint runs.

Format: `## [YYYY-MM-DD] <op> | <summary>`
Operations: `ingest`, `migration`, `lint`, `query` (only when it reveals a gap), `decision`.

---

## [2026-05-12] migration | Karpathy-style wiki migration from monolithic MASTER_INDEX.md

Replaced the 4 482-line `MASTER_INDEX.md` (319 entries, 12 categories) with a structured wiki.

**Output:**
- 48 concept pages under `concepts/` — each synthesizes 2–20 related entries from the legacy index, with `[[sources/<vid>]]` citations and verbatim prompt commands preserved.
- 209 source pages planned under `sources/` (one per video that contributed an entry). 85 generated so far; remainder pending — see *2026-05-12 decision* below.
- 7 people pages and 6 org pages planned under `people/` and `orgs/`. None generated yet — pending.
- `AGENTS.md` (schema/workflow doc) and `index.md` (category-grouped catalog) written from scratch.
- Legacy `MASTER_INDEX.md` archived to `backups/MASTER_INDEX_pre_wiki_migration.md`.

**Tooling:** Clustering and page synthesis done via `gemini -m gemini-2.5-flash` headless calls, dispatched in parallel via `xargs -P`. Splitter + reconciler are Python scripts in `/tmp/nate-migration/`. One ID collision in the legacy index (two distinct entries shared `BZO-002`) was resolved by renumbering the second occurrence to `BZO-016`.

## [2026-05-12] decision | Pause source-page generation at gemini daily quota (RESOLVED — see resume entries below)

Source-page batch hit `QUOTA_EXHAUSTED` after generating 85/209 pages. Free-tier `gemini-2.5-flash` daily limit; reset is ~23 h. Resume state saved at `/tmp/nate-migration/RESUME_SOURCES.txt` (124 remaining video IDs) and `/tmp/nate-migration/RESUME_PEOPLE_ORGS.txt` (7 people + 6 orgs). The wiki is usable as-is: concept pages cite source IDs even when the corresponding source page is not yet rendered, and broken `[[sources/<vid>]]` wikilinks are tolerated per `AGENTS.md` § *Wikilinks*.

**To resume after quota reset:**

```bash
# Sources
cat /tmp/nate-migration/RESUME_SOURCES.txt | grep -v '^#' | grep -v '^$' \
  | xargs -I{} -P 2 /tmp/nate-migration/run_one_source.sh {}

# People + orgs (small, run sequentially)
while read p; do
  kind=${p%%/*}; slug=${p##*/}
  /tmp/nate-migration/run_one_personorg.sh "$kind" "$slug"
done < /tmp/nate-migration/RESUME_PEOPLE_ORGS.txt
```

## [2026-05-12] migration | Wiki migration resume — second quota window

After ~23h quota reset, resumed the source/people/org page generation. Rebuilt `/tmp/nate-migration/` (input files, runners, RESUME list) from scratch via `build_inputs.py` since `/tmp` had been wiped — derived from `backups/MASTER_INDEX_pre_wiki_migration.md` plus the existing `concepts/*.md` frontmatter.

**Generated this window:**
- 45 new source pages (130/209 total).
- 7/7 people pages (`nate`, `karpathy`, `rob-pike`, `altman`, `amodei`, `benedict-evans`, `ilya-sutskever`).
- 5/6 org pages — all except `google`.
- 3 source pages failed after 5 retries (transient gemini errors, not quota): `JdTgxpfCa3E`, `KT4v_I9zvH4`, `bjcDgqKgvho`.
- Daily quota hit again partway through; batch stopped cleanly. Updated `/tmp/nate-migration/RESUME_SOURCES.txt` to the 79 remaining IDs.

**Still pending:** 79 source pages, `orgs/google.md`, and the 3 failed source IDs above. Resume same way as before once quota resets.

## [2026-05-12] migration | Migration complete — switched to gemini-2.5-flash-lite

Per-model quotas are independent. After `gemini-2.5-flash` hit daily limit (twice), switched the runner to `gemini-2.5-flash-lite` (fresh quota) and finished the remainder in one batch. The 3 previously-failed source IDs (`JdTgxpfCa3E`, `KT4v_I9zvH4`, `bjcDgqKgvho`) all succeeded on flash-lite — confirms those were transient flash-side errors, not bad inputs.

**Final tallies:**
- Concepts: 48/48
- Sources: 209/209
- People: 7/7
- Orgs: 6/6

Runner scripts now respect `$GEMINI_MODEL` env var (default `gemini-2.5-flash-lite`) so future re-runs can flip models freely.

## [2026-05-29] ingest | 13 new videos scraped + indexed across the 4 playlists

Ran `scripts/scrape_new_videos.py`: 15 new videos found vs the 281-video manifest; **13 transcripts fetched, 2 failed** (private videos `O7UmComyuaM`, `b6J387xJvHg`, recorded in manifest without transcripts). Manifest now **296 videos**. Repairs along the way: fixed `scrape_new_videos.py` `BASE` (was hardcoded to a non-existent absolute path; now derived from the script's own location) and installed `youtube-transcript-api`.

All 13 mapped to **existing** concepts — no new concept pages, so `index.md` taxonomy unchanged (header counts/date refreshed). **13 source pages** created; **48 insight bullets** added across **27 concept pages**; 1 prompt command added to [[concepts/advanced-prompting-techniques]] (Hostile Reviewer). Integrator: `scripts/_integrate_2026-05-29.py`.

- [[sources/725QE_LNXT4]] The Prove-It Economy → [[concepts/ai-business-strategy]], [[concepts/agentic-commerce]], [[concepts/ai-career-skills]], [[concepts/ai-content-creation]]
- [[sources/LIkYVsxMpS8]] When to Automate/Build/Buy/Hire/Wait → [[concepts/practical-agent-adoption]], [[concepts/ai-roi-and-value-proposition]], [[concepts/model-selection-frameworks]], [[concepts/enterprise-ai-adoption]]
- [[sources/MFzxIT88zfg]] Build a Deck, Then Attack It → [[concepts/ai-quality-control]], [[concepts/advanced-prompting-techniques]], [[concepts/model-comparison-and-performance]], [[concepts/knowledge-work-delegation]]
- [[sources/NRBQmwlILjk]] Shopify's River (public AI work) → [[concepts/organizational-ai-transformation]], [[concepts/open-brain-systems]], [[concepts/ai-security-and-trust]], [[concepts/enterprise-ai-adoption]]
- [[sources/adNErrz2aA0]] SaaS's Second Meter → [[concepts/ai-economy-and-bottlenecks]], [[concepts/ai-business-strategy]], [[concepts/enterprise-ai-adoption]], [[concepts/agent-orchestration-architecture]]
- [[sources/j5_wcDifNko]] Agentic Commerce Protocol War → [[concepts/agentic-commerce]], [[concepts/ai-infrastructure-evolution]], [[concepts/ai-industry-competitive-landscape]]
- [[sources/jwtpMSRAPAQ]] Trillion-Dollar Implementation Layer → [[concepts/ai-business-strategy]], [[concepts/agent-orchestration-architecture]], [[concepts/ai-industry-competitive-landscape]], [[concepts/enterprise-ai-adoption]]
- [[sources/lqiwQiDglGk]] Pinecone Demotes Vector Search → [[concepts/rag-architecture-and-chunking]], [[concepts/agent-memory-systems]], [[concepts/ai-infrastructure-evolution]]
- [[sources/ltbzgzZZmgI]] The Data-Room Writing Hack → [[concepts/ai-productivity-workflows]], [[concepts/advanced-prompting-techniques]], [[concepts/ai-quality-control]]
- [[sources/n0nC1kmztSk]] Cursor Wiped a DB / Agent Analytics → [[concepts/agent-evaluation-and-reliability]], [[concepts/ai-security-and-trust]]
- [[sources/ogTLWGBc3cE]] The AI Question Method → [[concepts/advanced-prompting-techniques]], [[concepts/prompting-and-skill-design]], [[concepts/ai-builder-mindset]]
- [[sources/z3pbrFKVyQE]] Infra Nightmare (OpenAI interview) → [[concepts/ai-infrastructure-evolution]], [[concepts/multi-agent-system-design]], [[concepts/ai-security-and-trust]], [[concepts/model-selection-frameworks]]
- [[sources/zP6TnEiueEc]] Six Agent Protocols (Google I/O) → [[concepts/mcp-architecture]], [[concepts/ai-infrastructure-evolution]], [[concepts/agent-orchestration-architecture]], [[concepts/ai-security-and-trust]]

## [2026-05-29] lint | `kb_lint.py` (Session_template) clean for this ingest

48 concepts · 270 sources · 7 people · 6 orgs · **0 orphans · 0 missing_sources · 0 stale_volatile · 0 new broken wikilinks**. Two pre-existing broken wikilinks remain — the literal `sources/<vid>` format placeholders (lines 15 and 25 of this log's migration-era text) — and were left as documentation, not real links.

## [2026-05-30] ingest | agent-species concept page (manual; synthesizes existing source) | YpPcDHc3e9U
