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

## [2026-06-15] ingest | Stop Picking Between Claude Code and Codex | Do This Instead | R2-Y1Hjwx2U

- Source page: [[sources/R2-Y1Hjwx2U]]
- Concepts touched: [[concepts/model-selection-frameworks]], [[concepts/practical-agent-adoption]]
- Insights added: 2

## [2026-06-15] ingest | Microsoft Says 86% Treat AI Output as a Starting Point. Your Resume Just Changed | UsCgEuIAclE

- Source page: [[sources/UsCgEuIAclE]]
- Concepts touched: [[concepts/ai-career-skills]]
- Insights added: 4

## [2026-06-15] ingest | My Codex Ran 800 Million Tokens in A Day. The Real Story Isn't Cost. | l8BloTSLK6M

- Source page: [[sources/l8BloTSLK6M]]
- Concepts touched: [[concepts/ai-engineering-principles]], [[concepts/multi-agent-system-design]], [[concepts/ai-personal-stack]] (+ 1 new: [[concepts/ai-usage-telemetry]])
- Insights added: 4

## [2026-06-15] ingest | My AI Workflow Has Changed (Here is What I Learned) | rqVzTX8w_w0

- Source page: [[sources/rqVzTX8w_w0]]
- Concepts touched: [[concepts/ai-productivity-workflows]], [[concepts/prompting-and-skill-design]]
- Insights added: 2

## [2026-06-29] ingest | The Skill vs Prompt Problem Everyone Gets Wrong | 9PUaEj0pMYE

- Source page: [[sources/9PUaEj0pMYE]]
- Concepts touched: [[concepts/open-brain-systems]], [[concepts/prompting-and-skill-design]]
- Insights added: 2 (Open Skills as portable procedure layer; skill-vs-prompt distinction)

## [2026-06-29] ingest | I Stopped Prompting AI One Task At A Time. This Works Better. | A4zMyjkL0Dc

- Source page: [[sources/A4zMyjkL0Dc]]
- Concepts touched: [[concepts/agent-orchestration-architecture]]
- Insights added: 1 (agents as loop managers; the loop of loops control pattern)

## [2026-06-29] ingest | Don't build more AI agents until you watch this | BOXK2XFLA-E

- Source page: [[sources/BOXK2XFLA-E]]
- Concepts touched: 1 new: [[concepts/agent-harness-and-maintenance]]
- Insights added: 3 (prune tools; agents break when the model improves; agents inherit system crud)

## [2026-06-29] ingest | I Was The Only Thing Connecting Claude, ChatGPT, and Codex | QSK4vf_ZTRA

- Source page: [[sources/QSK4vf_ZTRA]]
- Concepts touched: [[concepts/open-brain-systems]], [[concepts/issue-tracking-evolution]]
- Insights added: 2 (Open Engine; the queue as cross-provider coordination layer)

## [2026-06-29] ingest | GLM 5.2 Is Free And Beats Claude On Most Work | Zp8lr6IzUnQ

- Source page: [[sources/Zp8lr6IzUnQ]]
- Concepts touched: [[concepts/model-selection-frameworks]], [[concepts/agent-harness-and-maintenance]]
- Insights added: 3 (center vs edge of distribution routing; last-mile harness as the moat; renting your company brain)

## [2026-06-29] ingest | You Can't Run AI Agents Without This | rh_PcL26zls

- Source page: [[sources/rh_PcL26zls]]
- Concepts touched: [[concepts/agent-harness-and-maintenance]], [[concepts/practical-agent-adoption]]
- Insights added: 3 (care and feeding: job/diet/boundaries/review; single named owner + agent roster; maintenance is the 2026 skill)

## [2026-06-29] ingest summary | 6 videos, 14 insights, 1 new concept (agent-harness-and-maintenance) | via index-nate-kb plugin

## [2026-06-29] grounding | wired agent-harness-and-maintenance -> classify-architecture, optimize

## [2026-06-29] grounding audit | wired 5 relevant concepts into worker skills
- agent-species -> classify-architecture (swapped out model-selection-frameworks; still grounded via decompose-tasks)
- knowledge-work-delegation -> orient
- ai-assisted-research -> build-context
- ai-usage-telemetry -> design-evals
- ai-safety-and-alignment -> red-team
- Remaining ungrounded concepts are market/strategy/tool-trend pages, intentionally not pulled into spec-engineering grounding (minimum-viable-context, Axiom 5).

## [2026-07-28] ingest | You Can't Compete on Cheap Models Anymore | 1cSNE-ZkDLQ

- Source page: [[sources/1cSNE-ZkDLQ]]
- Concepts touched: [[concepts/ai-builder-mindset]], [[concepts/model-selection-frameworks]], [[concepts/organizational-ai-transformation]]
- Insights added: 4

## [2026-07-28] ingest | I Cut the Internet and Let AI Read the File I Could Never Upload. It Caught the Leak. | 5slsNizN6MQ

- Source page: [[sources/5slsNizN6MQ]]
- Concepts touched: [[concepts/ai-security-and-trust]], [[concepts/model-selection-frameworks]]
- Insights added: 4

## [2026-07-28] ingest | How to Use AI on Files You're Not Allowed to Upload | EuVvLwWZ5wc

- Source page: [[sources/EuVvLwWZ5wc]]
- Concepts touched: [[concepts/ai-security-and-trust]]
- Insights added: 5

## [2026-07-28] ingest | I Built My Own AI Memory by Talking to Claude. It Did 80% Itself. | HgAQOkG_v8c

- Source page: [[sources/HgAQOkG_v8c]]
- Concepts touched: [[concepts/open-brain-systems]], [[concepts/ai-personal-stack]], [[concepts/ai-security-and-trust]], [[concepts/agent-memory-systems]], [[concepts/practical-agent-adoption]]
- Insights added: 5

## [2026-07-28] ingest | Fable 5 And GPT-5.6 Don't Need Better Prompts. They Need A Clean Setup | PDJfciNhyHU

- Source page: [[sources/PDJfciNhyHU]]
- Concepts touched: [[concepts/agent-harness-and-maintenance]]
- Insights added: 6

## [2026-07-28] ingest | 1.6M agents registered for OpenClaw and did NOTHING. | PRqiGS6fnIM

- Source page: [[sources/PRqiGS6fnIM]]
- Concepts touched: [[concepts/practical-agent-adoption]], [[concepts/multi-agent-system-design]], [[concepts/agent-evaluation-and-reliability]], [[concepts/knowledge-work-delegation]]
- Insights added: 5

## [2026-07-28] ingest | Every AI Agent Demo Stops at Email. I Pointed Mine at the Bills That Cost You Money. | U4TmrlWEY4M

- Source page: [[sources/U4TmrlWEY4M]]
- Concepts touched: [[concepts/agent-orchestration-architecture]], [[concepts/agent-harness-and-maintenance]], [[concepts/rag-architecture-and-chunking]], [[concepts/model-selection-frameworks]], [[concepts/practical-agent-adoption]]
- Insights added: 5

## [2026-07-28] ingest | Your Roadmap Is Why You're Losing to AI-Native Teams. | hYcOFTMesGc

- Source page: [[sources/hYcOFTMesGc]]
- Concepts touched: [[concepts/organizational-ai-transformation]], [[concepts/ai-roi-and-value-proposition]], [[concepts/semantic-engineering]], [[concepts/ai-builder-mindset]]
- Insights added: 5

## [2026-07-28] ingest | Your Next AI Subscription Shouldn't Be ChatGPT 5.6 Or Fable 5. It Should Be Both. | jOWXBzP6nNg

- Source page: [[sources/jOWXBzP6nNg]]
- Concepts touched: [[concepts/model-comparison-and-performance]], [[concepts/model-selection-frameworks]], [[concepts/agent-orchestration-architecture]], [[concepts/knowledge-work-delegation]]
- Insights added: 4

## [2026-07-28] ingest | Stop Wasting Money on the Wrong AI | lq2fP7wC7d8

- Source page: [[sources/lq2fP7wC7d8]]
- Concepts touched: [[concepts/model-selection-frameworks]], [[concepts/agent-harness-and-maintenance]]
- Insights added: 4

## [2026-07-28] ingest | Claude Fable 5 Bossed 20 Cheap AI Agents. The Whole Site Cost $8. | suY66oTDn0s

- Source page: [[sources/suY66oTDn0s]]
- Concepts touched: [[concepts/multi-agent-system-design]], [[concepts/agent-evaluation-and-reliability]], [[concepts/prompting-and-skill-design]], [[concepts/model-selection-frameworks]]
- Insights added: 5

## [2026-07-28] ingest | Codex vs Fable: Which AI Agent Picked the Better Problem? | uCWKXIyvM_8

- Source page: [[sources/uCWKXIyvM_8]]
- Concepts touched: [[concepts/prompting-and-skill-design]], [[concepts/model-comparison-and-performance]], [[concepts/multi-agent-system-design]]
- Insights added: 3

## [2026-08-10] ingest | Your Chatbot Hallucinated in 2024. Your Agent Lies in 2026. | 2wVvdX0ZxVw

- Source page: [[sources/2wVvdX0ZxVw]]
- Concepts touched: [[concepts/agent-evaluation-and-reliability]], [[concepts/ai-quality-control]], [[concepts/agent-harness-and-maintenance]]
- Insights added: 4

## [2026-08-10] ingest | Don't Be an AI Slop Sender: Master This Skill Instead | AWGoOtNgw3c

- Source page: [[sources/AWGoOtNgw3c]]
- Concepts touched: [[concepts/ai-quality-control]], [[concepts/prompting-and-skill-design]]
- Insights added: 4

## [2026-08-10] ingest | 29% Of Your Employees Are Sabotaging Your AI Rollout. The Fix Is 3 Things. | JIGaCPv44QI

- Source page: [[sources/JIGaCPv44QI]]
- Concepts touched: [[concepts/enterprise-ai-adoption]], [[concepts/ai-job-market-dynamics]]
- Insights added: 5

## [2026-08-10] ingest | Paste This Into Claude, Never Hit a Token Limit Again | Y8vAQ1FgNbM

- Source page: [[sources/Y8vAQ1FgNbM]]
- Concepts touched: [[concepts/prompting-and-skill-design]], [[concepts/mcp-architecture]], [[concepts/open-brain-systems]]
- Insights added: 3

## [2026-08-10] ingest | I Stopped Installing Claude Skills. Here's What I Do Instead. | up0Bsf3f0Xc

- Source page: [[sources/up0Bsf3f0Xc]]
- Concepts touched: [[concepts/prompting-and-skill-design]], [[concepts/agent-harness-and-maintenance]]
- Insights added: 4

## [2026-08-20] ingest | Cheap software made your PM job harder, not easier. Here's the new job. | b6J387xJvHg

- Source page: [[sources/b6J387xJvHg]]
- Concepts touched: [[concepts/organizational-ai-transformation]], [[concepts/enterprise-ai-adoption]]
- Insights added: 4

## [2026-08-20] ingest | Claude Design Does In 30 Minutes What Your Team Does In A Sprint | KlPxWaY91rE

- Source page: [[sources/KlPxWaY91rE]]
- Concepts touched: [[concepts/organizational-ai-transformation]], [[concepts/ai-industry-competitive-landscape]]
- Insights added: 4

## [2026-08-20] ingest | I Looked At Amazon After They Fired 16,000 Engineers. Their AI Broke Everything. | E1idsrv79tI

- Source page: [[sources/E1idsrv79tI]]
- Concepts touched: [[concepts/ai-engineering-principles]]
- Insights added: 5

## [2026-08-20] ingest | Nobody Typed A Line Of OpenAI's Million-Line Product. You Can Work This Way Too. | HZLPhPbw3fM

- Source page: [[sources/HZLPhPbw3fM]]
- Concepts touched: [[concepts/agent-memory-systems]]
- Insights added: 5 (plus 1 prompt command)

## [2026-08-20] ingest | Nobody Laid Out The Five Kinds Of Software You Can Make. So I Did. | joRXo6x7Pgk

- Source page: [[sources/joRXo6x7Pgk]]
- Concepts touched: [[concepts/vibe-coding-phenomenon]], [[concepts/open-brain-systems]]
- Insights added: 5 (plus 1 prompt command)

## [2026-10-06] ingest | OpenAI Pays $280,000 For This Job. You Don't Have To Be An Engineer. | 0bLI31EFDDs

- Source page: [[sources/0bLI31EFDDs]]
- Concepts touched: [[concepts/ai-career-skills]], [[concepts/agent-evaluation-and-reliability]], [[concepts/ai-job-market-dynamics]]
- Insights added: 5

## [2026-10-06] ingest | Nobody Gave You A Control For Quality. 6 Habits So You Can Ship Faster Anyway. | 2IAYFgAqX6g

- Source page: [[sources/2IAYFgAqX6g]]
- Concepts touched: [[concepts/agent-harness-and-maintenance]], [[concepts/agent-memory-systems]], [[concepts/ai-quality-control]]
- Insights added: 6

## [2026-10-06] ingest | Stop Paying $200 For Work An $18 Model Can Do Inside Claude Code And Codex. | 4HvFqhtCb-A

- Source page: [[sources/4HvFqhtCb-A]]
- Concepts touched: [[concepts/model-selection-frameworks]], [[concepts/agent-memory-systems]], [[concepts/claude-code-architecture]], [[concepts/codex-agent-architecture]]
- Insights added: 5

## [2026-10-06] ingest | How I Fight AI Brain Rot. Friction Maxxing With Codex, Grok And Claude. | CSCwaqVqHGE

- Source page: [[sources/CSCwaqVqHGE]]
- Concepts touched: [[concepts/ai-builder-mindset]], [[concepts/agent-evaluation-and-reliability]], [[concepts/ai-quality-control]], [[concepts/multi-agent-system-design]]
- Insights added: 4

## [2026-10-06] ingest | Agents Aren't Taking Your Jobs. They're Creating More Work Instead. | IpEaSa7tgfc

- Source page: [[sources/IpEaSa7tgfc]]
- Concepts touched: [[concepts/ai-job-market-dynamics]], [[concepts/knowledge-work-delegation]], [[concepts/practical-agent-adoption]], [[concepts/enterprise-ai-adoption]], [[concepts/ai-security-and-trust]]
- Insights added: 5

## [2026-10-06] ingest | I Stopped Knowing What My Computer Was Doing. Then I Asked OpenAI Why. | TR8RDUzQaMo

- Source page: [[sources/TR8RDUzQaMo]]
- Concepts touched: [[concepts/codex-agent-architecture]], [[concepts/organizational-ai-transformation]], [[concepts/model-selection-frameworks]], [[concepts/chatgpt-agentic-design]], [[concepts/generative-ui-strategy]]
- Insights added: 5

## [2026-10-06] ingest | AI Is About To Spend Your Money. I Went To Stripe To Ask Who Stops It. | YTG0rdHPTDE

- Source page: [[sources/YTG0rdHPTDE]]
- Concepts touched: [[concepts/ai-security-and-trust]], [[concepts/agentic-commerce]], [[concepts/ai-roi-and-value-proposition]]
- Insights added: 5

## [2026-10-06] ingest | You can be ambitious without the huge token bill. Here's how. | eLpRDIvOMEw

- Source page: [[sources/eLpRDIvOMEw]]
- Concepts touched: [[concepts/ai-roi-and-value-proposition]], [[concepts/model-selection-frameworks]], [[concepts/agent-harness-and-maintenance]], [[concepts/agent-evaluation-and-reliability]]
- Insights added: 6

## [2026-10-06] ingest | There Are Jobs You Could Never Give AI. I Gave GPT-6 Astra 20 Hours Of Admin. | ix8SsXjBc7M

- Source page: [[sources/ix8SsXjBc7M]]
- Concepts touched: [[concepts/knowledge-work-delegation]], [[concepts/multi-agent-system-design]], [[concepts/model-comparison-and-performance]]
- Insights added: 5 (plus 1 prompt command)

## [2026-10-06] ingest | Runable Raised $21 Million On Agents That Finish. Nobody Told Yours What Done Means. | qYe1GsMRElw

- Source page: [[sources/qYe1GsMRElw]]
- Concepts touched: [[concepts/agent-evaluation-and-reliability]], [[concepts/ai-quality-control]], [[concepts/enterprise-ai-adoption]], [[concepts/ai-roi-and-value-proposition]], [[concepts/practical-agent-adoption]]
- Insights added: 5

## [2026-10-06] ingest | When Will AI Make Me Scrambled Eggs? I Went To NVIDIA To Find Out. | ry9J1i3krIY

- Source page: [[sources/ry9J1i3krIY]]
- Concepts touched: [[concepts/agent-evaluation-and-reliability]], [[concepts/agent-harness-and-maintenance]], [[concepts/ai-infrastructure-evolution]] (+ 1 new: [[concepts/world-models-and-physical-ai]])
- Insights added: 6

## [2026-10-06] ingest | Why Developers Are Losing Their Minds Over AI That Can't Write | tYugqJ9YytQ

- Source page: [[sources/tYugqJ9YytQ]]
- Concepts touched: [[concepts/agent-orchestration-architecture]], [[concepts/ai-economy-and-bottlenecks]] (+ 1 new: [[concepts/general-purpose-classifiers]])
- Insights added: 5

## [2026-10-06] lint | refreshed stale index.md stats line (53 concepts, 314 source pages, 342 videos); added 2 new concepts to index

## [2026-10-06] grounding | wired general-purpose-classifiers → decompose-tasks

## [2026-10-06] grounding | world-models-and-physical-ai ingested but not yet grounded (no worker skill fits cleanly)
