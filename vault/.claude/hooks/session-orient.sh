#!/usr/bin/env bash
# session-orient.sh
# Fires at the start of every Claude Code session in this vault.
# Counts pending work, flags stale notes, and surfaces what needs attention.

VAULT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TODAY=$(date +%Y-%m-%d)
TODAY_EPOCH=$(date +%s)

echo ""
echo "=== SRX Manufacturing Knowledge Vault ==="
echo "Session: $TODAY"
echo ""

# ── Pending Queue ───────────────────────────────────────────────────────────

UNMINED_TRANSCRIPTS=$(find "$VAULT_DIR/transcripts" -maxdepth 1 -name "*.txt" -o -name "*.md" 2>/dev/null | grep -v "commits" | wc -l | tr -d ' ')
PENDING_COMMITS=$(find "$VAULT_DIR/transcripts/commits/pending" -name "*.yaml" 2>/dev/null | xargs grep -l "status: pending" 2>/dev/null | wc -l | tr -d ' ')

if [ "$UNMINED_TRANSCRIPTS" -gt 0 ] || [ "$PENDING_COMMITS" -gt 0 ]; then
  echo "PENDING QUEUE"
  [ "$UNMINED_TRANSCRIPTS" -gt 0 ] && echo "  ⚠  $UNMINED_TRANSCRIPTS unmined transcript(s) — run /mine"
  [ "$PENDING_COMMITS" -gt 0 ]     && echo "  ⚠  $PENDING_COMMITS pending commit event(s) — run /mine-commits"
  echo ""
fi

# ── Overdue Decision Reviews ────────────────────────────────────────────────

OVERDUE_DECISIONS=()
while IFS= read -r file; do
  review_date=$(grep "^review_date:" "$file" 2>/dev/null | awk '{print $2}')
  if [ -n "$review_date" ]; then
    review_epoch=$(date -d "$review_date" +%s 2>/dev/null || date -j -f "%Y-%m-%d" "$review_date" +%s 2>/dev/null)
    if [ -n "$review_epoch" ] && [ "$TODAY_EPOCH" -gt "$review_epoch" ]; then
      OVERDUE_DECISIONS+=("$(basename "$file")")
    fi
  fi
done < <(find "$VAULT_DIR/decisions" -name "*.md" 2>/dev/null)

if [ "${#OVERDUE_DECISIONS[@]}" -gt 0 ]; then
  echo "OVERDUE DECISION REVIEWS (${#OVERDUE_DECISIONS[@]})"
  for f in "${OVERDUE_DECISIONS[@]}"; do
    echo "  ⚠  $f"
  done
  echo ""
fi

# ── Active High-Critical Risks ──────────────────────────────────────────────

HIGH_CRITICAL_RISKS=()
while IFS= read -r file; do
  likelihood=$(grep "^likelihood:" "$file" 2>/dev/null | awk '{print $2}')
  impact=$(grep "^impact:" "$file" 2>/dev/null | awk '{print $2}')
  status=$(grep "^status:" "$file" 2>/dev/null | awk '{print $2}')
  if [ "$status" = "active" ] && [ "$likelihood" = "high" ] && [ "$impact" = "critical" ]; then
    HIGH_CRITICAL_RISKS+=("$(basename "$file")")
  fi
done < <(find "$VAULT_DIR/risks" -name "*.md" 2>/dev/null)

if [ "${#HIGH_CRITICAL_RISKS[@]}" -gt 0 ]; then
  echo "ACTIVE HIGH-CRITICAL RISKS (${#HIGH_CRITICAL_RISKS[@]})"
  for f in "${HIGH_CRITICAL_RISKS[@]}"; do
    echo "  🔴 $f"
  done
  echo ""
fi

# ── Blocked Projects ────────────────────────────────────────────────────────

BLOCKED_PROJECTS=()
while IFS= read -r file; do
  status=$(grep "^status:" "$file" 2>/dev/null | awk '{print $2}')
  if [ "$status" = "blocked" ]; then
    BLOCKED_PROJECTS+=("$(basename "$file" .md)")
  fi
done < <(find "$VAULT_DIR/projects" -name "*.md" 2>/dev/null)

if [ "${#BLOCKED_PROJECTS[@]}" -gt 0 ]; then
  echo "BLOCKED PROJECTS (${#BLOCKED_PROJECTS[@]})"
  for p in "${BLOCKED_PROJECTS[@]}"; do
    echo "  🚫 $p"
  done
  echo ""
fi

# ── Stale Vendor Profiles ───────────────────────────────────────────────────

STALE_VENDORS=()
while IFS= read -r file; do
  priority=$(grep "^monitoring_priority:" "$file" 2>/dev/null | awk '{print $2}')
  last_reviewed=$(grep "^last_reviewed:" "$file" 2>/dev/null | awk '{print $2}')
  if [ -z "$last_reviewed" ]; then continue; fi

  case "$priority" in
    high)   max_days=14 ;;
    medium) max_days=30 ;;
    low)    max_days=90 ;;
    *)      max_days=30 ;;
  esac

  last_epoch=$(date -d "$last_reviewed" +%s 2>/dev/null || date -j -f "%Y-%m-%d" "$last_reviewed" +%s 2>/dev/null)
  if [ -n "$last_epoch" ]; then
    days_ago=$(( (TODAY_EPOCH - last_epoch) / 86400 ))
    if [ "$days_ago" -gt "$max_days" ]; then
      entity=$(grep "^entity:" "$file" 2>/dev/null | cut -d'"' -f2)
      STALE_VENDORS+=("$entity (${days_ago}d ago, ${priority} priority)")
    fi
  fi
done < <(find "$VAULT_DIR/vendors" -name "*.md" 2>/dev/null)

if [ "${#STALE_VENDORS[@]}" -gt 0 ]; then
  echo "STALE VENDOR PROFILES (${#STALE_VENDORS[@]})"
  for v in "${STALE_VENDORS[@]}"; do
    echo "  📋 $v"
  done
  echo ""
fi

# ── Stale Compliance Notes ──────────────────────────────────────────────────

STALE_COMPLIANCE=()
while IFS= read -r file; do
  last_reviewed=$(grep "^last_reviewed:" "$file" 2>/dev/null | awk '{print $2}')
  if [ -z "$last_reviewed" ]; then continue; fi
  last_epoch=$(date -d "$last_reviewed" +%s 2>/dev/null || date -j -f "%Y-%m-%d" "$last_reviewed" +%s 2>/dev/null)
  if [ -n "$last_epoch" ]; then
    days_ago=$(( (TODAY_EPOCH - last_epoch) / 86400 ))
    if [ "$days_ago" -gt 30 ]; then
      STALE_COMPLIANCE+=("$(basename "$file") (${days_ago}d ago)")
    fi
  fi
done < <(find "$VAULT_DIR/compliance" -name "*.md" 2>/dev/null)

if [ "${#STALE_COMPLIANCE[@]}" -gt 0 ]; then
  echo "STALE COMPLIANCE NOTES (${#STALE_COMPLIANCE[@]})"
  for c in "${STALE_COMPLIANCE[@]}"; do
    echo "  📋 $c"
  done
  echo ""
fi

# ── All Clear ───────────────────────────────────────────────────────────────

TOTAL_FLAGS=$(( UNMINED_TRANSCRIPTS + PENDING_COMMITS + ${#OVERDUE_DECISIONS[@]} + ${#HIGH_CRITICAL_RISKS[@]} + ${#BLOCKED_PROJECTS[@]} + ${#STALE_VENDORS[@]} + ${#STALE_COMPLIANCE[@]} ))

if [ "$TOTAL_FLAGS" -eq 0 ]; then
  echo "  ✓ Vault is healthy. No pending actions."
  echo ""
fi

echo "Skills available: /mine  /mine-commits  /review  /adr  /m3-lookup  /compliance-check  /runbook"
echo "=========================================="
echo ""
