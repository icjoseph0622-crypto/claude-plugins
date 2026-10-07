---
description: Save a durable fact to the memory vault (updates an existing entry if one covers it).
argument-hint: "<what to remember>"
---

Save this to the memory vault, following the `memory-vault` skill: **$ARGUMENTS**

1. Grep `%USERPROFILE%\.claude\memory-vault\INDEX.md` for a related entry. If one exists, update that entry instead of making a new one.
2. Otherwise create `entries/<slug>.md` (short, bullet points, `tags:` and `updated:` lines) and add one index line.
3. Never store passwords, keys or tokens.
4. Reply with one line: the slug and whether it was created or updated.
