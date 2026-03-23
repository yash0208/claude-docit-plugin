---
description: Load past Docit summaries, pick what matches the user's bug or question, then investigate using those paths and structure. Use after a feature was documented and something breaks later.
---

# Docit — `/docit:up` (pick up from past docs)

You are in **Claude Code** in the **current workspace**. The user has a **new problem** (bug, regression, unclear behavior) and wants to use **earlier Docit session files** as a map—not start from zero.

Full reference: `prompts/DOCIT_UP.md` (same instructions as this file).

## Steps

1. **Discover documents**  
   - List files under `.claude/documents/` (create the directory only if you need to report it is missing; do not create placeholder docs).  
   - If the folder is missing or has no `.md` files: tell the user there are no Docit summaries yet, suggest running **`/docit:doc`** after meaningful sessions, and continue helping from the current message only.

2. **Read what matters**  
   - Read frontmatter (`date`, `generatedAt`) and skim sections **1–3**, **5–6**, and **8** of each file (overview, architecture, paths, known failure points).  
   - Optionally skim project-root **`agents.md`** for Docit-captured guidance if it exists.

3. **Match to the user’s issue**  
   - From the user’s latest message (and thread context), infer: feature area, error text, file names they mentioned, or stack traces.  
   - **Rank** the most relevant summaries (typically 1–3). Explain in 2–4 sentences *why* they match (shared paths, same subsystem, same feature name, etc.).  
   - If nothing matches well, say so and still pick the closest doc or fall back to repo exploration.

4. **Build a short working brief**  
   - For the best match(es), extract: **file paths** from section 6, **architecture notes** from section 5, **prior failure modes** from section 8.  
   - Present this as a compact bullet list before you touch code.

5. **Investigate and fix**  
   - Open the relevant files from the brief; compare current behavior to what the document described.  
   - Trace the bug using the same structure (data flow, modules) the original session documented.  
   - Propose and apply fixes; keep changes aligned with **Technical Decisions** and architecture from the doc when still valid.

6. **Confirm**  
   - State which `.claude/documents/*.md` files you used and what you changed in the repo.

## Do not

- Run the full 12-section **write** template here (that is **`/docit:doc`**).  
- Invent past session content—only use what is on disk plus this chat.
