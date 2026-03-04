#!/usr/bin/env bash
# write-validate.sh
# Validates YAML frontmatter schema for newly created or modified vault notes.
# Called with the file path as the first argument.
# Usage: ./write-validate.sh vault/decisions/my-decision.md

FILE="$1"

if [ -z "$FILE" ]; then
  echo "write-validate: no file specified"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "write-validate: file not found: $FILE"
  exit 1
fi

ERRORS=()
FILENAME=$(basename "$FILE")
DIRPATH=$(dirname "$FILE")
CATEGORY=$(echo "$DIRPATH" | rev | cut -d'/' -f1 | rev)

# ── Extract frontmatter ──────────────────────────────────────────────────────

has_field() {
  grep -q "^$1:" "$FILE" 2>/dev/null
}

field_nonempty() {
  local val
  val=$(grep "^$1:" "$FILE" 2>/dev/null | sed "s/^$1: *//")
  [ -n "$val" ]
}

has_list_items() {
  # Check that after the field line there is at least one "  - " item
  awk "/^$1:/{found=1; next} found && /^  - /{print; exit} found && /^[a-z]/{exit}" "$FILE" | grep -q "  - "
}

# ── Validate by category ─────────────────────────────────────────────────────

case "$CATEGORY" in

  decisions)
    has_field "id"           || ERRORS+=("decisions: missing 'id' field (e.g., id: ADR-001)")
    has_field "decision"     || ERRORS+=("decisions: missing 'decision' field — use proposition phrasing")
    has_field "status"       || ERRORS+=("decisions: missing 'status' field")
    has_field "reversibility" || ERRORS+=("decisions: missing 'reversibility' field (type-1-irreversible or type-2-reversible)")
    has_field "review_date"  || ERRORS+=("decisions: missing 'review_date' field")
    has_field "assumptions"  || ERRORS+=("decisions: missing 'assumptions' field — every decision needs at least one testable assumption")
    has_field "alternatives" || ERRORS+=("decisions: missing 'alternatives' field — must list at least one rejected alternative")
    ;;

  risks)
    has_field "risk"          || ERRORS+=("risks: missing 'risk' field — use scenario phrasing")
    has_field "category"      || ERRORS+=("risks: missing 'category' field")
    has_field "likelihood"    || ERRORS+=("risks: missing 'likelihood' field (low|medium|high)")
    has_field "impact"        || ERRORS+=("risks: missing 'impact' field (low|moderate|critical)")
    has_field "status"        || ERRORS+=("risks: missing 'status' field (active|mitigated|closed)")
    has_field "early_warnings" || ERRORS+=("risks: missing 'early_warnings' field — must list at least one observable signal")
    has_field "mitigations"   || ERRORS+=("risks: missing 'mitigations' field — must list at least one concrete action")
    ;;

  transactions)
    has_field "program"       || ERRORS+=("m3-knowledge/transactions: missing 'program' field (e.g., program: MMS200MI)")
    has_field "description"   || ERRORS+=("m3-knowledge/transactions: missing 'description' field")
    has_field "key_fields"    || ERRORS+=("m3-knowledge/transactions: missing 'key_fields' field")
    has_field "last_verified" || ERRORS+=("m3-knowledge/transactions: missing 'last_verified' date")
    ;;

  tables)
    has_field "table"         || ERRORS+=("m3-knowledge/tables: missing 'table' field (e.g., table: MITMAS)")
    has_field "description"   || ERRORS+=("m3-knowledge/tables: missing 'description' field")
    ;;

  compliance)
    has_field "topic"          || ERRORS+=("compliance: missing 'topic' field")
    has_field "category"       || ERRORS+=("compliance: missing 'category' field (lhdn-myinvois|iso-27001|internal)")
    has_field "last_reviewed"  || ERRORS+=("compliance: missing 'last_reviewed' field")
    # LHDN notes must have SDK version
    if grep -q "^category: lhdn-myinvois" "$FILE" 2>/dev/null; then
      has_field "lhdn_sdk_version" || ERRORS+=("compliance: LHDN note is missing 'lhdn_sdk_version' field")
    fi
    ;;

  projects)
    has_field "project"  || ERRORS+=("projects: missing 'project' field")
    has_field "status"   || ERRORS+=("projects: missing 'status' field (planning|active|blocked|completed)")
    has_field "phase"    || ERRORS+=("projects: missing 'phase' field")
    ;;

  vendors)
    has_field "entity"               || ERRORS+=("vendors: missing 'entity' field")
    has_field "monitoring_priority"  || ERRORS+=("vendors: missing 'monitoring_priority' field (high|medium|low)")
    has_field "last_reviewed"        || ERRORS+=("vendors: missing 'last_reviewed' field")
    ;;

  *)
    # Unknown category — no schema enforcement, but check for frontmatter presence
    if ! grep -q "^---" "$FILE" 2>/dev/null; then
      ERRORS+=("note: file has no YAML frontmatter (---) — add frontmatter or move to the correct folder")
    fi
    ;;
esac

# ── Filename check ───────────────────────────────────────────────────────────

# Warn if filename looks like a topic rather than a proposition
# Topics: single word or generic names like "decision.md", "notes.md"
BASENAME_NOEXT="${FILENAME%.md}"
WORD_COUNT=$(echo "$BASENAME_NOEXT" | wc -w | tr -d ' ')
if [ "$WORD_COUNT" -le 1 ] && [[ "$CATEGORY" =~ ^(decisions|risks|strategy|vendors)$ ]]; then
  ERRORS+=("filename: '$FILENAME' looks like a topic, not a proposition. Use 'subject verb object.md' format.")
fi

# ── Output ───────────────────────────────────────────────────────────────────

if [ "${#ERRORS[@]}" -eq 0 ]; then
  echo "write-validate: ✓ $FILENAME"
  exit 0
else
  echo ""
  echo "write-validate: ✗ Schema validation failed for $FILENAME"
  echo ""
  for err in "${ERRORS[@]}"; do
    echo "  ERROR: $err"
  done
  echo ""
  echo "Fix these issues before the note is usable by vault skills."
  exit 1
fi
