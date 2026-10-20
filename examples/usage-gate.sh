#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# usage-gate.sh — a TEACHING version of the pre-emptive usage gate.
#
# Put a wrapper like this in front of your agent binary so EVERY subscription-lane
# run is gated. The golden rule: FAIL CLOSED. If anything is uncertain, refuse.
# The worst case must be "the agent waits", never "a surprise bill".
#
# This file is illustrative and self-contained (no real endpoints). Adapt the
# marked spots to your own setup. Prove it refuses BEFORE you wire in a token.
# ─────────────────────────────────────────────────────────────────────────────
set -euo pipefail

# --- config (keep in sync with company.yaml) ---------------------------------
SESSION_THRESHOLD_PCT=85
WEEKLY_THRESHOLD_PCT=90
STALE_AFTER_MINUTES=15
STATE_DIR="${STATE_DIR:-/srv/ops/state}"
HALT_FILE="${HALT_FILE:-$STATE_DIR/HALT}"
USAGE_FILE="${USAGE_FILE:-$STATE_DIR/usage.json}"   # written by a separate probe
REAL_AGENT="${REAL_AGENT:-/usr/local/bin/agent-cli-REAL}"

log()  { printf '%s gate: %s\n' "$(date -u +%FT%TZ)" "$*" >&2; }
deny() { log "DENY — $*"; exit 73; }                # 73 = refuse; never run the agent

# --- 1. HALT: the big red button --------------------------------------------
[ -e "$HALT_FILE" ] && deny "HALT file present ($HALT_FILE)"

# --- 2. No paid fallback on the subscription lane ----------------------------
# If an API key has leaked into the environment, the agent could spill into paid
# usage. Refuse rather than risk it.
if [ -n "${ANTHROPIC_API_KEY:-}${OPENAI_API_KEY:-}${LLM_API_KEY:-}" ]; then
  deny "an API key is present in the environment (subscription lane must have none)"
fi

# --- 3. Usage data must exist and be fresh -----------------------------------
[ -r "$USAGE_FILE" ] || deny "usage data missing ($USAGE_FILE)"
now=$(date +%s)
mtime=$(stat -c %Y "$USAGE_FILE" 2>/dev/null || echo 0)
age_min=$(( (now - mtime) / 60 ))
[ "$age_min" -gt "$STALE_AFTER_MINUTES" ] && deny "usage data is stale (${age_min} min old)"

# A real probe writes JSON like: {"session_pct":34,"weekly_pct":46,"credits":0}
session_pct=$(jq -r '.session_pct // 100' "$USAGE_FILE")
weekly_pct=$( jq -r '.weekly_pct  // 100' "$USAGE_FILE")
credits_moved=$(jq -r '.credits   // 0'  "$USAGE_FILE")

# --- 4. Refuse if the window is at/above threshold ---------------------------
[ "$session_pct" -ge "$SESSION_THRESHOLD_PCT" ] && deny "session window ${session_pct}% ≥ ${SESSION_THRESHOLD_PCT}%"
[ "$weekly_pct"  -ge "$WEEKLY_THRESHOLD_PCT"  ] && deny "weekly window ${weekly_pct}% ≥ ${WEEKLY_THRESHOLD_PCT}%"

# --- 5. Refuse if paid credits moved recently --------------------------------
[ "$credits_moved" != "0" ] && deny "paid credits moved recently (=${credits_moved})"

# --- all clear: hand off to the real agent -----------------------------------
log "ALLOW — session ${session_pct}% / weekly ${weekly_pct}% — starting run"
exec "$REAL_AGENT" "$@"
