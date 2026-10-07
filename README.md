# anyag-tools - Claude Code plugins

## council
- `/council <question>` - four agents debate it: **Believer** (best case for), **Skeptic** (assumptions, pre-mortem, quickest test), **Investor** (cost vs payoff, cheaper 80/20 path), then the **Judge** rules: GO / GO WITH CHANGES / NOT YET / NO-GO + next steps.
- `/council lite <question>` - same four voices in one reply, no sub-agents (about a quarter of the cost).
- `/think <problem>` - careful reasoning out loud before acting.
- Skill `critical-thinking` - Claude runs this checklist on its own before risky fixes (symptom vs cause, evidence vs assumption, cheapest disproving check, verify before "done").
- The three advocates run on Sonnet to save credits; the Judge uses your current model.

## memory-vault
- Memory lives in `%USERPROFILE%\.claude\memory-vault\` - `INDEX.md` (one line per memory) + `entries\<slug>.md`.
- At every session start a hook shows Claude ONLY the index (a few hundred tokens). Full entries are opened just when a task needs them.
- `/remember <fact>`, `/recall <topic>`, `/vault-tidy`.
- Already seeded with 7 memories about HEAD FIRST! (code layout, patching gotchas, icon + thumbnail pipelines, game systems, testing tricks, your preferences).

## Install (from an interactive `claude` terminal)
```
/plugin marketplace add icjoseph0622-crypto/claude-plugins
/plugin install council@anyag-tools
/plugin install memory-vault@anyag-tools
```
Restart Claude Code afterwards so the session-start hook loads.
