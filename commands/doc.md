---
description: Save this session as a Docit summary (.claude/documents/) and append guidance to agents.md. Run /docit:doc after meaningful work.
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

4. **Section 11 — suggested project guidance:** Take the 3–6 rules from that section and **merge them into `agents.md`** at the project root (create the file if it does not exist):
   - Append a new `##` section at the end: `## Docit — <YYYY-MM-DD> — <short title from Document Title>`.
   - Under it, a one-line intro: `Guidance captured from this Claude Code session (Docit):`
   - Then a bullet list: one bullet per rule from section 11 (same wording as in the summary).
   - If a section with the exact same heading already exists from a prior run, append ` (2)`, ` (3)` to the heading instead of overwriting.
   - Do **not** create or edit `.cursor/` paths or `.mdc` files.

5. **Confirm** the paths you wrote or updated (`agents.md` and the summary under `.claude/documents/`).

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

### 11. Suggested Project Guidance

Rules the **user asked to follow** or that emerged from the session: structure, architecture, patterns, conventions for **future Claude Code work** on this repo. Write 3–6 rules. Each rule = one clear, standalone instruction; keep each to one sentence when possible. These same bullets are **appended to `agents.md`** (see Steps). List them here in the summary as plain numbered or bulleted lines.

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
