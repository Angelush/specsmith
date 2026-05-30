# Specsmith

> Turn a vague idea into a production-grade agent spec — a workflow you can delegate, verify, own, and share.

Specsmith is **not** a prompt generator. It's a **spec-engineering harness**: a set of composable Claude Code skills that interview you, classify what kind of agent system your work actually needs, build its context / constraints / evals, adversarially stress-test it, and emit a portable **workflow bundle** you keep on disk.

It exists because the leverage in 2026 isn't clever prompting — it's the four cumulative disciplines underneath it:

```
Prompt Craft  →  Context Engineering  →  Intent Engineering  →  Specification Engineering
(table stakes)    (curate the environment)  (encode what to want)    (a blueprint an agent runs solo)
```

These are **cumulative — failures compound downward.** A brilliant prompt on a broken context layer still fails. Specsmith diagnoses your weakest rung and fixes it first.

## What makes it different

It's built so its **structure embodies** the principles instead of citing them:

- **It right-sizes.** `orient` diagnoses you, then routes to a **Quick / Standard / Deep** subset of skills. A one-shot task doesn't get dragged through a thirteen-phase gauntlet.
- **It grounds before it advises.** Every skill opens by loading the relevant knowledge bundle *first* (build the data room before the work), not by tacking citations on at the end.
- **It produces a habit, not a string.** The output is a `workflows/<slug>/` bundle — context + spec + constraints + evals + the interaction pattern + a review gate — that you re-run next quarter on a better model and share with a friend.
- **Evals are first-class.** "It finished" ≠ "you trust it." A mandatory judge step proves every stress-test finding became an enforceable requirement.

## Quickstart

```bash
git clone <your-fork>/specsmith
# the knowledge base ships bundled at knowledge/kb/ — nothing to link.
# (optional) point at your own wiki instead: export SPECSMITH_KB="/path/to/your/wiki"
```

Then, in Claude Code, just describe what you want:

> "Help me turn my client-reporting process into something I can delegate to an agent."

The `orient` skill takes it from there. (Or install as a plugin — see *Sharing* below.)

## The skills

| Skill | Job | Discipline |
|---|---|---|
| `orient` | diagnose the user, route to the right subset | planner |
| `classify-architecture` | pick the Agent Species + run the complexity-floor gate | architecture |
| `engineer-intent` | find the real objective + the correctness contract | Intent |
| `build-context` | assemble the information environment (data room first) | Context |
| `engineer-spec` | self-contained spec + the meaning layer | Specification |
| `author-constraints` | MUST/MUST-NOT/escalation + species-scoped enforcement | Specification |
| `decompose-tasks` | task DAG with a reliability budget *(deep)* | Specification |
| `design-evals` | acceptance criteria + A/B/C tests + golden set | Evaluation |
| `red-team` | hostile review, failure modes, stress tests | Evaluation |
| `simulate` | dry-run the species across timelines *(deep)* | Reflection |
| `optimize` | score prompt variants against the golden set *(deep)* | Reflection |
| `audit-feedback-loop` | judge: every finding → an enforceable requirement | judge |
| `capture-habit` | write the reusable, shareable workflow habit | Reuse |

## Grounded, but not dependent

Specsmith is grounded in a knowledge base distilled from **Nate B. Jones**'s AI-education work (48 concepts, 270 source-video pages). It ships **bundled** at [`knowledge/kb/`](knowledge/kb/) — source-grounded out of the box, no setup. Point `$SPECSMITH_KB` at your own wiki to override it, or run on the eight-axiom fallback in `knowledge/principles-core.md` if you strip it out. Only the curated wiki is included; the raw transcripts are not. See [`knowledge/KB-LINK.md`](knowledge/KB-LINK.md).

## Composes with Superpowers

Specsmith owns the **upstream** (what to build + how to know it's right). [Superpowers](https://github.com/obra/superpowers) owns the **downstream** (build it well). Specsmith hands off to `brainstorming`, `writing-plans`, `test-driven-development`, and `verification-before-completion` at the seams. See [`CLAUDE.md`](CLAUDE.md).

## Sharing with friends

It's a plain repo of skills — clone it, or install it as a Claude Code plugin (`.claude-plugin/plugin.json` is included). No personal data, no platform lock-in, no Windows paths. The bundled knowledge base comes with it, so friends get the full source-grounded system out of the box.

## Attribution

Specsmith's substance comes from the public work of **Nate B. Jones**, an AI strategist and educator who publishes daily, practitioner-focused analysis of where AI is actually useful. The **four-discipline ladder**, the **Agent Species framework** (from his Tobi Lütke video, `sources/YpPcDHc3e9U`), and every insight in the bundled knowledge base are distilled from his videos — each `knowledge/kb/sources/<id>.md` page carries the original video ID so you can go watch the source. The distillation, the skill architecture, and any errors are the maintainer's; the ideas are his. If this is useful to you, support him directly:

- **YouTube** — [@NateBJones](https://www.youtube.com/@NateBJones) *(AI News & Strategy Daily)*
- **Substack** — [natesnewsletter.substack.com](https://natesnewsletter.substack.com/)
- **Site** — [natebjones.com](https://www.natebjones.com/)

See [`docs/`](docs/) for the frameworks. Built to compose with Jesse Vincent's [Superpowers](https://github.com/obra/superpowers).

## License

MIT — see [`LICENSE`](LICENSE).
