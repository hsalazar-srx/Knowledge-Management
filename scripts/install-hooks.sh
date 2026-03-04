#!/usr/bin/env bash
# install-hooks.sh
# Installs the KM vault post-commit hook into all companion projects.
# Run this once after cloning, and again after adding a new project.
#
# Usage:
#   ./scripts/install-hooks.sh              — install into all known projects
#   ./scripts/install-hooks.sh --dry-run    — show what would be installed
#   ./scripts/install-hooks.sh /path/to/repo — install into a specific repo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK_TEMPLATE="$SCRIPT_DIR/post-commit-template.sh"
DRY_RUN=false
SPECIFIC_REPO=""

# ── Parse arguments ──────────────────────────────────────────────────────────

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    /*|./*)    SPECIFIC_REPO="$arg" ;;
    *)         SPECIFIC_REPO="$arg" ;;
  esac
done

# ── Validate template exists ─────────────────────────────────────────────────

if [ ! -f "$HOOK_TEMPLATE" ]; then
  echo "ERROR: Hook template not found at $HOOK_TEMPLATE"
  exit 1
fi

# ── Known companion project paths ────────────────────────────────────────────

COMPANION_PROJECTS=(
  "c:/Projects/MOVEX/API-Integration/movex-rest-api"
  "c:/Projects/MyInvois-Service"
  "c:/Projects/SM-Portal"
  "c:/Projects/PLM/PLMServer"
  "c:/Projects/WMS"
  "c:/Projects/DIFOT"
  "c:/Projects/Reporting-Service"
)

# Override with specific repo if provided
if [ -n "$SPECIFIC_REPO" ]; then
  COMPANION_PROJECTS=("$SPECIFIC_REPO")
fi

# ── Install function ─────────────────────────────────────────────────────────

install_hook() {
  local repo="$1"
  local hook_dest="$repo/.git/hooks/post-commit"

  # Check if this is a git repo
  if [ ! -d "$repo/.git" ]; then
    echo "  SKIP  $repo — not a git repository"
    return
  fi

  if [ "$DRY_RUN" = true ]; then
    if [ -f "$hook_dest" ]; then
      echo "  DRY   $repo — would update existing hook"
    else
      echo "  DRY   $repo — would install new hook"
    fi
    return
  fi

  # Check if an existing hook is already ours
  if [ -f "$hook_dest" ]; then
    if grep -q "Knowledge-Management" "$hook_dest" 2>/dev/null; then
      # Update it
      cp "$HOOK_TEMPLATE" "$hook_dest"
      chmod +x "$hook_dest"
      echo "  UPDATED  $repo"
    else
      # There's a different hook — back it up and prepend ours
      cp "$hook_dest" "${hook_dest}.backup-$(date +%Y%m%d)"
      echo "#!/usr/bin/env bash" > "$hook_dest"
      echo "# Combined hook: KM vault + original hook" >> "$hook_dest"
      echo "" >> "$hook_dest"
      cat "$HOOK_TEMPLATE" >> "$hook_dest"
      echo "" >> "$hook_dest"
      echo "# Original hook (backed up):" >> "$hook_dest"
      cat "${hook_dest}.backup-$(date +%Y%m%d)" >> "$hook_dest"
      chmod +x "$hook_dest"
      echo "  MERGED   $repo (original backed up as .backup-$(date +%Y%m%d))"
    fi
  else
    # Fresh install
    cp "$HOOK_TEMPLATE" "$hook_dest"
    chmod +x "$hook_dest"
    echo "  INSTALLED  $repo"
  fi
}

# ── Run ──────────────────────────────────────────────────────────────────────

echo ""
echo "=== KM Vault Hook Installer ==="
[ "$DRY_RUN" = true ] && echo "(dry run — no changes will be made)"
echo ""

INSTALLED=0
SKIPPED=0

for project in "${COMPANION_PROJECTS[@]}"; do
  if [ -d "$project" ]; then
    install_hook "$project"
    (( INSTALLED++ ))
  else
    echo "  SKIP  $project — directory not found"
    (( SKIPPED++ ))
  fi
done

echo ""
echo "Done. $INSTALLED project(s) processed, $SKIPPED skipped."
echo ""
echo "To add a new project later:"
echo "  ./scripts/install-hooks.sh /path/to/new/project"
echo ""
echo "To verify a hook is installed:"
echo "  cat /path/to/project/.git/hooks/post-commit"
echo ""
