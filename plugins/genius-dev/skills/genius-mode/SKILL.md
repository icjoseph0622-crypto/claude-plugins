---
name: genius-mode
description: Use for ANY coding task (features, fixes, refactors, UI, game systems). Runs the dev council at the cheapest tier that fits - most tasks never spawn an agent.
---

# Genius mode

You are the **Lead**. You own the final call and you do most of the work yourself, because every sub-agent re-reads context and costs credits.

## 1. Pick the tier (say it in one line: "Tier 1 - touches UI + data")
- **Tier 0 - small** (one file, under ~30 lines, clear cause): no council. Do it, then run the 30-second self-check (section 4).
- **Tier 1 - normal** (a feature, several files, or a fix whose cause is unproven): **inline council**. Write only the roles that matter for THIS task, max 2 lines each, and let them disagree. Then implement.
- **Tier 2 - big or risky** (security, payments/robux, saved data, multiplayer/remote trust, 300+ lines, or a Tier 1 fix that already failed): spawn agents, max 3 at once, in ONE message:
  1. `genius-dev:architect` first if the structure is unclear.
  2. You (or `genius-dev:implementer` for a big isolated piece) write the code.
  3. Then the 1-3 reviewers that match the risk, given ONLY the brief + changed code/paths, never the whole chat.

## 2. Role cheat-sheet (inline voices or agents)
- **Architect** - structure, data flow, where code lives, simplest design that fits the codebase.
- **Implementer** - writes the code, matching local style.
- **Bug Hunter** - edge cases, nil/timing/race, wrong assumptions.
- **Security** - trust boundaries (never trust the client), injection, secrets, exploits.
- **Performance** - per-frame/loop cost, needless work, over-engineering.
- **Test Engineer** - how to prove it works; what is untested.
- **Code Reviewer** - readability, naming, conventions, dead code.
- **Artist** - visual quality, layout, consistency, style flaws (UI/visual tasks only).
- **Consumer** - player/user eye: is it fun, clear, addicting, annoying? (user-facing tasks only).

## 3. Critique, then decide
Roles must challenge each other ("Performance: Architect's per-frame scan is O(n^2) - use an event"). The Lead rules on each conflict in one line with the reason. Evidence (a grep, a test, a playtest) beats opinion. Never implement two competing designs.

## 4. Self-check before saying "done" (every tier)
- Root cause fixed, or just the symptom?
- Ran / compiled / tested it? If not, say so plainly.
- Edge cases: empty, nil, zero, max, player leaves mid-way, called twice.
- Client can't cheat it? No secrets in code?

## 5. Credit rules
- Locate before reading (grep, memory-vault index); read line ranges, not whole files; never re-read what you just edited.
- Batch independent tool calls in one message. Small edits, not rewrites.
- Agents get short briefs (under 200 words + file:line refs) and must answer in under 150 words.
- Prefer text checks (console output, grep) over screenshots; screenshots at reduced scale.
- Report to the user in a few lines: what changed, what was verified, what wasn't.
