# Docit “up” workflow (`/docit:up`)

Use when the user has a **bug or question** about work that may have been **documented earlier** in Docit.

## Inputs

- User message describing the issue (errors, feature name, unexpected behavior).
- On disk: **`.claude/documents/*.md`** (past `/docit:doc` outputs), optionally **`agents.md`**.

## Algorithm (mirror of `commands/up.md`)

1. List and read relevant parts of past summaries (sections 1–3, 5–6, 8).
2. Match summaries to the current issue; rank and explain relevance.
3. Extract paths, architecture, and known failure points into a short brief.
4. Investigate in the repo using that brief; fix or advise.
5. Cite which doc files were used.

If no summaries exist, say so and help from the current session only.
