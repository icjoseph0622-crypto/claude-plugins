---
name: memory-vault
description: Use whenever you learn a durable fact worth keeping across sessions (project layout, IDs, conventions, gotchas, user preferences, decisions) or need to look one up. Keeps memory in ~/.claude/memory-vault as a tiny index + small entry files so recall costs very few tokens.
---

# Memory Vault

Location: `%USERPROFILE%\.claude\memory-vault\` (`~/.claude/memory-vault/`)
- `INDEX.md` - ONE line per memory: `- <slug> | <tags> | <one-line summary>` (loaded automatically at session start)
- `entries/<slug>.md` - the details for that memory

## Recall (cheap first, expensive last)
1. Look at the index already in context (from the SessionStart hook). Usually the summary line is enough.
2. If not, `Grep` the INDEX for a keyword or tag.
3. Only then `Read` the one or two `entries/<slug>.md` files you actually need. Never read the whole vault.
4. Facts in the vault can be stale. Before acting on a file path, ID or setting from memory, quickly confirm it still exists.

## Save (what is worth it)
Save when a fact will save real time or credits later, and is not obvious from the code itself:
- where things live, IDs and paths, how to run / build / test something
- conventions and patch patterns that worked; gotchas and their fixes
- user preferences and decisions (with the why)
Do NOT save: one-off chatter, things that change every hour, secrets, passwords, API keys or tokens.

## How to write an entry (keep it tight)
1. Check the index for an existing entry on the same topic - UPDATE it instead of duplicating.
2. Slug: short kebab-case, e.g. `headfirst-icon-pipeline`.
3. Entry file (`entries/<slug>.md`), aim for under ~25 lines:
   ```markdown
   # <title>
   tags: <tag1>, <tag2>
   updated: <YYYY-MM-DD>

   - fact
   - fact (path / ID / command)
   - gotcha -> fix
   ```
4. Add or update ONE line in `INDEX.md`: `- <slug> | <tags> | <summary under ~100 chars>`.
5. Tags: project name first (e.g. `headfirst`), then topic (`ui`, `icons`, `combat`, `studio`, `prefs`...).

## Housekeeping
- When an entry is proven wrong, fix or delete it (and its index line) right away.
- `/vault-tidy` merges duplicates, trims long entries and keeps the index short.
