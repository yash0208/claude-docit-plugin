---
description: List all Docit session files in .claude/documents/ with date and title—quick index before using /docit:up.
---

# Docit — `/docit:list` (index summaries)

List every **`.md`** file under **`.claude/documents/`** in the project root.

## Steps

1. Enumerate files (e.g. glob `**/.claude/documents/*.md`). If the directory is missing or empty, say so and mention that **`/docit:doc`** creates summaries after sessions.

2. For each file, read **YAML frontmatter** if present (`date`, `generatedAt`) and the **first heading or Document Title** line after frontmatter.

3. Output a **compact table** or bullet list:

   | File | Date | Title / topic |
   |------|------|----------------|

4. One closing line: suggest **`/docit:up`** when the user needs to debug using these docs, or **`/docit:doc`** to add a new summary.

Keep the reply short; no full document reread unless the user asks.
