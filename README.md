# Claude Docit plugin

Document your **Claude Code** session as a developer learning artifact: a structured markdown summary under `.cursor/docusor/summaries/` and optional `.cursor/rules/*.mdc` from section 11.

Works for **anyone** who runs Claude Code with this plugin directory.

## Requirements

- [Claude Code](https://claude.com/claude-code) CLI

## Install (command line)

### Option A — Use this folder as the plugin (no copy)

From the directory that contains `.claude-plugin/` and `commands/`:

```bash
claude --plugin-dir "/absolute/path/to/claude-docit-plugin"
```

### Option B — Install to `~/.local/share` (recommended)

```bash
cd /path/to/claude-docit-plugin
chmod +x install.sh
./install.sh
```

Then start Claude with the printed path, e.g.:

```bash
claude --plugin-dir "$HOME/.local/share/claude-docit-plugin"
```

On macOS/Linux with `XDG_DATA_HOME` set, the install target is `$XDG_DATA_HOME/claude-docit-plugin`.

## Usage

1. Start Claude Code with `--plugin-dir` pointing at this plugin (see above).
2. In the chat, run: **`/docit:docit`**

The agent will write:

- `.cursor/docusor/summaries/<Document Title>.md` — full 12-section summary  
- `.cursor/rules/<slug>.mdc` — one file per rule from section 11 (if any)

## Optional: `-docit` in your project

To treat **`-docit`** like Docit in a repo, add the contents of `CLAUDE.md.snippet` to your project’s **`CLAUDE.md`** (or merge the rule into your existing file).

## Plugin layout

| Path | Role |
|------|------|
| `.claude-plugin/plugin.json` | Plugin manifest |
| `commands/docit.md` | Slash command `/docit:docit` |
| `prompts/DOCIT_SESSION.md` | Same spec as in the command (reference copy) |

## Reload after edits

If you change plugin files:

```
/reload-plugins
```

## License

MIT — see `LICENSE`.
