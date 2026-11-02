---
title: Black October Isn't Just A PHP Bug. Attackers Want Your AI Keys.
type: source
video_id: qDYe2eTl_D4
url: https://www.youtube.com/watch?v=qDYe2eTl_D4
playlists: []
concepts: [agent-security-baseline, model-selection-frameworks, ai-security-and-trust]
updated: 2026-11-03
---

# Black October Isn't Just A PHP Bug. Attackers Want Your AI Keys.

A week of breaches Nate calls "Blocktober": critical PHP (mod_php) flaws, eMudhra root-certificate keys so weak one was the number four (recovered by Claude with a single prompt), a LiteLLM release that shipped credential-stealing malware while its source tag stayed clean, a hosting breach that pushed a founder to take his product offline over exposed Anthropic and Stripe keys, and a state-aligned group running an agent framework against hundreds of orgs. His frame: agents are native to computers, offense and defense are the same read-test-retry loop, attacks now cost one person with an agent fleet, and the two-year patch debate is gone. AI API keys behave like cash. Defenders should put the strongest model on their side, pick it with a known-answer incident reproduction, reduce attack surface before the next bug instead of only patching faster, and watch for agents themselves leaking secrets into logs and personal data into URLs.

## Concepts covered

- [[concepts/agent-security-baseline]] — new checks: verify the installed artifact not the source repo, keep model-provider keys away from build identities, treat AI keys as cash, scrub secrets from agent output and logs, keep personal data out of agent-built URLs, prune connected-app and extension scopes, disclose incidents transparently.
- [[concepts/model-selection-frameworks]] — choose a security-investigation model with a known-answer incident reproduction and graded investigation milestones; do not economize here.
- [[concepts/ai-security-and-trust]] — offense and defense share one agent loop; attacks are now cheap and individual; reduce reachable code and config-interaction surface proactively.

## Notable quotes

- "Tokens are starting to behave like cash."
- "AI is taking away the time cyber defenders had to have 2-year-long conversation about vulnerabilities."
- "In general, this is not a place to be cheap."

## Provenance

`data/transcripts/qDYe2eTl_D4.txt`
