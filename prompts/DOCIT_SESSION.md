# Docit session documentation (Claude Code)

Use **this Claude Code conversation** as the source of truth. Summarize from the start of the session as far as your context allows. Produce a **developer learning document**: a knowledge artifact and debugging guide. Be technically clear and concise.

Output **exactly** these sections in this order (use the exact `##` headers shown). Do not add commentary outside the sections.

---

## Document Title

A single line: short, specific title in 5–8 words that clearly identifies the session (e.g. `Add JWT Login API`, `Fix Transcript JSONL Parsing`). No period. Use title case. This will be the saved filename (sanitize for the filesystem: no `/ \ : * ? " < > |`).

---

## 1. Session Overview

What the developer asked you to do, what problem or feature was worked on, and the final outcome. 3–5 sentences.

---

## 2. Problem Context

Technical context: relevant system component or module, why the change was needed, what part of the project it impacts. Help an unfamiliar developer understand why the work happened.

---

## 3. Implementation Summary

What was implemented: features added, fixes applied, configuration changes, architectural changes. Use concise bullet points.

---

## 4. How Cursor Solved It (Step-by-Step)

Chronological technical breakdown of what happened in this session: major steps (reading files, modifying modules, writing new code, refactoring, adjusting config, adding validation). For each step include the reasoning behind the change. (In a Claude-only session, describe what **Claude** did step by step.) Help developers retrace the implementation.

---

## 5. Architecture / Design Impact

How the work affects system design: component relationships, new modules, data flow changes, API behavior. Include HLD and component interaction if applicable.

---

## 6. Project Structure Changes

Where changes occurred. Use a path-style listing (e.g. `src/summarize.ts — updated template logic`). List new files, modified files, and structural refactors.

---

## 7. Technical Decisions

Important decisions made: why a specific approach was chosen, tradeoffs, performance or maintainability implications.

---

## 8. Debugging & Failure Points

Potential or actual issues (incorrect parsing, prompt issues, truncation, wrong heuristics, etc.). For each: why it happened and how it was corrected. Meant for future debugging.

---

## 9. Mistakes Cursor Made

Explicit list. Each bullet: Mistake · Cause · Correction. If none: `None identified.` (If only Claude was involved, list mistakes **Claude** made in the same format.)

---

## 10. Effectiveness of the Solution

Whether the implementation solves the original problem, limitations, possible improvements. 2–4 sentences.

---

## 11. Suggested Cursor Rules

Rules the **user asked to follow** or that emerged from the session: structure, architecture, patterns, conventions. Write 3–6 rules. Each rule = one clear, standalone instruction. These will be saved as separate `.mdc` files under `.cursor/rules/` with short hyphenated slugs from the first ~6 words of each rule (lowercase, letters and hyphens only, max ~40 chars). Keep each rule one sentence when possible.

---

## 12. Optional Diagram

Only if the session involved system flow or architecture: one Mermaid diagram (`flowchart`, `sequenceDiagram`, or similar). Omit this section if not useful.

---

## Frontmatter for the saved summary file

When writing the main `.md` file, start with YAML frontmatter:

```yaml
---
date: YYYY-MM-DD
source: claude-code-docit
generatedAt: <ISO-8601>
---
```

Then the title line and body sections as usual. Add a line under the main title: **Session date:** … · **Source:** Claude Code Docit plugin (`/docit:docit`).
