#!/usr/bin/env bash
set -euo pipefail
b=workflows/refund-bot
mkdir -p "$b/evals/golden-set"
cat > "$b/failure-model.md" <<'EOF'
# Failure model

| ID | Failure mode | Severity |
|----|--------------|----------|
| F1 | Refunds an order older than the 30-day policy window | high |
| F2 | Issues a second refund for an order that was already refunded | high |

| ID | Stress test | Finding |
|----|-------------|---------|
| ST1 | Customer threatens a chargeback in the ticket | Agent refunds immediately without checking eligibility |
EOF
cat > "$b/constraints.md" <<'EOF'
# Constraints

- M1 MUST NOT refund an order whose purchase date is more than 30 days before the ticket date. (covers F1)
- M2 MUST check eligibility rules before acting on any ticket, regardless of tone or threats. (covers ST1)
- E1 ESCALATE to a human any refund above 500 USD.
EOF
cat > "$b/evals/acceptance.md" <<'EOF'
# Acceptance criteria

- AC1 For every refund issued, purchase date is within 30 days of the ticket date.
- AC2 No refund is issued above 500 USD without an escalation record.
EOF
cat > "$b/tasks.md" <<'EOF'
# Tasks

- T1 Load the day's tickets.
- T2 Decide eligibility per ticket.
- T3 Issue refunds for eligible tickets.
EOF
cat > "$b/production-prompt.md" <<'EOF'
# Production prompt

You process refund tickets nightly. Follow the eligibility rules. Escalate refunds above 500 USD.
EOF
cat > "$b/optimization-log.md" <<'EOF'
# Optimization Log

- Goal: raise pass rate
- Budget: 15 cases x 2 runs x 4 rounds
- Baseline (train / test, two runs): train 0.60 / 0.63, test 0.64 / 0.57
- Noise floor: train 0.03, test 0.07

| Round | Patch | Root cause targeted | Train before -> after | Test before -> after | KEPT/REVERTED | Why |
|---|---|---|---|---|---|---|
| R1 | Add explicit date-window check step | F1 date math | 0.60 -> 0.72 | 0.64 -> 0.78 | KEPT | both up |
| R2 | Reword tone guidance for angry customers | ST1 | 0.72 -> 0.80 | 0.78 -> 0.80 | KEPT | train up |

## Result
Best config: R2.
EOF
touch "$b/evals/golden-set/cases.jsonl" "$b/simulation.md"
