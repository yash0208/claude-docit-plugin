---
description: Save session to .claude/documents/; append only explicit user rules to agents.md under a single ## Docit section. Run /docit:doc after meaningful work.
---

# Docit — `/docit:doc` (document session)

You are in **Claude Code** in the same session as the user. **No separate API call** — use this conversation as the source.

## Steps

1. **Follow the specification** in the section **Output specification** below (same content as `prompts/DOCIT_SESSION.md` in this plugin). Use every section and header exactly.

2. **Summarize** this session from the beginning as far as your context allows. If the session is very long, state that the summary may be partial and focus on the most impactful work.

3. **Write the main summary file** under the **current workspace / project root** (where the user opened Claude Code):
   - Path: `.claude/documents/<Document Title>.md`
   - Create `.claude/documents/` if needed.
   - Use the **Document Title** line as the filename (sanitize forbidden path characters; max ~50 chars for the base name).
   - If that file exists, use ` (2)`, ` (3)`, etc. before `.md`.
   - YAML frontmatter: `date`, `source: claude-code-docit`, `generatedAt` (ISO-8601).

4. **`agents.md` (only explicit user rules):** Read section 11 of what you are about to write. **Update `agents.md`** at the project root **only if** section 11 contains one or more real instructions (not the placeholder “none” line — see section 11 spec).
   - Use **exactly one** heading for Docit, always: **`## Docit`** (no dates, no session title in the heading). Never add a new `## Docit — …` heading per run.
   - If **`## Docit`** already exists, **append new bullets only** under that section (after its existing bullets). Do not rename or duplicate the heading.
   - If **`## Docit`** does not exist, create it at the **end** of `agents.md` (create the file if needed). Optional one line under the heading: `User explicitly asked these constraints for Claude Code (Docit appends here):`
   - For each instruction from section 11, add **one** bullet. Prefix with `(<YYYY-MM-DD>) ` for traceability. **Skip** a bullet if the same instruction text is already present under **`## Docit`** (avoid duplicates).
   - If section 11 says there were no explicit instructions, **do not** open or change `agents.md` for Docit rules (still write the summary file as usual).
   - Legacy headings like `## Docit — …` from older Docit runs: leave them as-is; add **`## Docit`** at EOF if missing and append only there going forward.
   - Do **not** create or edit `.cursor/` paths or `.mdc` files.

5. **Confirm** the paths you wrote or updated (summary under `.claude/documents/`; note if `agents.md` was unchanged because there were no strict user instructions).

---

## Output specification

Use **this Claude Code conversation** as the source of truth. Summarize from the start of the session as far as your context allows. Produce a **developer learning document**: a knowledge artifact and debugging guide. Be technically clear and concise.

Output **exactly** these sections in this order (use the exact `##` headers shown). Do not add commentary outside the sections.

### Document Title

A single line: short, specific title in 5–8 words that clearly identifies the session (e.g. `Add JWT Login API`, `Fix Transcript JSONL Parsing`). No period. Use title case. This will be the saved filename (sanitize for the filesystem: no `/ \ : * ? " < > |`).

### 1. Session Overview

What the developer asked you to do, what problem or feature was worked on, and the final outcome. 3–5 sentences.

### 2. Problem Context

Technical context: relevant system component or module, why the change was needed, what part of the project it impacts. Help an unfamiliar developer understand why the work happened.

### 3. Implementation Summary

What was implemented: features added, fixes applied, configuration changes, architectural changes. Use concise bullet points.

### 4. How Claude Handled It (Step-by-Step)

Chronological technical breakdown of what happened in this session: major steps (reading files, modifying modules, writing new code, refactoring, adjusting config, adding validation). For each step include the reasoning behind the change. Describe what **Claude** did step by step. Help developers retrace the implementation.

### 5. Architecture / Design Impact

How the work affects system design: component relationships, new modules, data flow changes, API behavior. Include HLD and component interaction if applicable.

### 6. Project Structure Changes

Where changes occurred. Use a path-style listing (e.g. `src/summarize.ts — updated template logic`). List new files, modified files, and structural refactors.

### 7. Technical Decisions

Important decisions made: why a specific approach was chosen, tradeoffs, performance or maintainability implications.

### 8. Debugging & Failure Points

Potential or actual issues (incorrect parsing, prompt issues, truncation, wrong heuristics, etc.). For each: why it happened and how it was corrected. Meant for future debugging.

### 9. Mistakes Claude Made

Explicit list. Each bullet: Mistake · Cause · Correction. If none: `None identified.`

### 10. Effectiveness of the Solution

Whether the implementation solves the original problem, limitations, possible improvements. 2–4 sentences.

### 11. Strict user instructions (agents.md sync)

**Purpose:** List **only** things the **user explicitly said** they want enforced—hard constraints or clear “do / don’t” orders. Examples: “Don’t add `secrets/` to PRs”, “Never edit `legacy/foo.js` without asking”, “Always run `pnpm test` before finishing”.

**Do not** include: inferred style preferences, generic best practices, architectural suggestions, or rules Claude inferred unless the **user** stated them as instructions.

- If there are none: write exactly **`None — no explicit user instructions to sync to agents.md.`** (and then **do not** modify `agents.md` for Docit — see Steps).
- If there are some: use a short bullet list (as many as the user actually gave, not a quota). Wording should match what you will append under **`## Docit`** in `agents.md`.

### 12. Optional Diagram

Only if the session involved system flow or architecture: one Mermaid diagram (`flowchart`, `sequenceDiagram`, or similar). Omit this section if not useful.

### Frontmatter for the saved summary file

Start the written `.md` file with:

```yaml
---
date: YYYY-MM-DD
source: claude-code-docit
generatedAt: <ISO-8601>
---
```

Then `# Docit: Developer learning document` (or equivalent title), then **Session date:** … · **Source:** Claude Code Docit (`/docit:doc`), then all `##` sections in order.
