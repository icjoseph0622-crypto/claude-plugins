---
description: Look something up in the memory vault, cheapest way first.
argument-hint: "<topic, keyword or tag>"
---

Look up **$ARGUMENTS** in the memory vault, following the `memory-vault` skill:
1. Grep `%USERPROFILE%\.claude\memory-vault\INDEX.md` (case-insensitive) for the keyword / tag.
2. Read only the 1-3 best-matching `entries/<slug>.md` files.
3. Answer in a few lines with what the vault says, and note anything that looks stale and should be re-checked.
