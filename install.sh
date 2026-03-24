#!/usr/bin/env bash
# Install Claude Docit plugin to a stable location and print how to run Claude with it.
set -euo pipefail

PLUGIN_NAME="claude-docit-plugin"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -n "${XDG_DATA_HOME:-}" ]]; then
  DATA_HOME="$XDG_DATA_HOME"
else
  DATA_HOME="${HOME}/.local/share"
fi

DEST="${DATA_HOME}/${PLUGIN_NAME}"

if [[ "$(cd "$SCRIPT_DIR" && pwd)" == "$(cd "$DEST" 2>/dev/null && pwd)" ]]; then
  echo "Already at install location: $DEST"
  echo "Run: claude --plugin-dir \"$DEST\""
  echo "Commands: /docit:doc  /docit:up  /docit:list"
  exit 0
fi

echo "Installing Docit plugin to: $DEST"
mkdir -p "$DEST"

# Copy plugin contents (exclude VCS and this script's temp if any)
rsync -a --delete \
  --exclude '.git' \
  --exclude '.DS_Store' \
  "${SCRIPT_DIR}/" "${DEST}/"

chmod +x "${DEST}/install.sh" 2>/dev/null || true

echo ""
echo "Done."
echo ""
echo "Run Claude Code with the plugin:"
echo "  claude --plugin-dir \"$DEST\""
echo ""
echo "After editing plugin files, reload in Claude:"
echo "  /reload-plugins"
echo ""
echo "Commands:"
echo "  /docit:doc    — .claude/documents/ + explicit rules under ## Docit in agents.md"
echo "  /docit:up     — read past docs, match issue, debug"
echo "  /docit:list   — index summaries"
