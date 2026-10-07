---
description: Tidy the memory vault - merge duplicates, trim long entries, drop stale ones, keep the index short.
---

Tidy `%USERPROFILE%\.claude\memory-vault\` following the `memory-vault` skill:
1. Read `INDEX.md`. Find entries that overlap, are obviously stale, or have summaries over ~100 characters.
2. Merge overlapping entries into one (keep the clearest slug), shorten bloated entries to the useful facts, delete ones that are wrong.
3. Make sure every index line points to an existing file and every file has an index line.
4. Show a short before/after summary (counts + what changed). Ask before deleting anything that might still matter.
