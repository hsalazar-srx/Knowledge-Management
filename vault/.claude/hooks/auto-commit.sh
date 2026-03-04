#!/usr/bin/env bash
# auto-commit.sh
# Commits all vault changes to git after every write operation.
# Maintains a complete, auditable version history of organizational knowledge.

VAULT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

cd "$VAULT_DIR" || exit 1

# Check if this is a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "auto-commit: vault is not a git repository. Run 'git init' in $VAULT_DIR."
  exit 0
fi

# Stage all changes
git add .

# Check if there is anything to commit
if git diff --cached --quiet; then
  exit 0
fi

# Commit with timestamp
git commit -m "vault: auto-sync [$TIMESTAMP]" --quiet

if [ $? -eq 0 ]; then
  echo "vault: changes committed [$TIMESTAMP]"
else
  echo "vault: commit failed — check git status in $VAULT_DIR"
fi
