---
name: critical-thinking
description: Use before committing to a non-trivial fix, design or claim - especially bug fixes where the cause is not proven yet, changes that touch several systems, or when a first fix already failed. A fast checklist that catches wrong root causes, untested assumptions and premature "done".
---

# Critical thinking checklist

Run this in your head (not out loud unless asked) before acting. It costs a few seconds and saves whole wasted rounds of work.

## 1. Pin the problem
- Restate what is actually wrong in one sentence, using the user's words. If the report is vague, find the concrete symptom first (exact message, value, screenshot, repro).
- Separate the **symptom** (what is seen) from the **cause** (why). Do not fix symptoms when the cause is findable.

## 2. Evidence before belief
- What do I KNOW (saw it in code, logs, a test) vs what do I ASSUME? Label assumptions.
- Find the cheapest check that would prove the leading theory wrong - and run it first (a grep, a print, a one-line test).
- If two theories fit, look for the observation that separates them.

## 3. Root cause, not first cause
- Ask "why" again after the first answer. Common traps:
  - an error that comes from a value set somewhere else (trace it back)
  - order of definition / execution (used before it exists, raced with a load)
  - a test artifact (the tool, a paused viewport, stale state) instead of a real bug
  - two systems that each look right but disagree with each other (e.g. server vs client math)
- Check whether my OWN earlier change caused it. Recent edits are the most likely suspect.

## 4. Before calling it done
- Did I verify the fix where the bug actually showed up, not just that the code compiles?
- What else uses the thing I changed? Quick grep for other callers / side effects.
- Is there a simpler change that does the same job?
- Report honestly: what was verified, what was not, and why.

## 5. When the stakes are high
If the decision is expensive, hard to undo, or the user is unsure, suggest the `/council` command (or run `/council lite` yourself) to get the Believer / Skeptic / Investor / Judge view before acting.
