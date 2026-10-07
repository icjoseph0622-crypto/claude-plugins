---
description: Convene the 4-member council (Believer, Skeptic, Investor, Judge) on a decision. Add "lite" at the start for a cheap single-pass version.
argument-hint: "[lite] <the decision or proposal to debate>"
---

# The Council

Proposal / question: **$ARGUMENTS**

## 0. Pick the mode
- If the arguments start with `lite`, run **LITE MODE** (no sub-agents, ~1/4 of the cost): write all four voices yourself in one reply, each clearly labelled, each following its role below, then the ruling. Keep each voice to ~80 words.
- Otherwise run **FULL MODE** below.

## 1. Brief (keep it short - this is what costs credits)
Write a compact brief (max ~200 words) that every member gets:
- The proposal in one sentence.
- The goal it serves and any hard constraints.
- Only the facts that matter, with file paths / line numbers they can open if they need detail. Do NOT paste whole files.

## 2. Advocates (FULL MODE) - in parallel
In ONE message, launch three sub-agents at the same time with the Agent tool, each given the brief:
- `believer` - strongest honest case FOR
- `skeptic` - assumptions, pre-mortem, root cause vs symptom, quickest test
- `investor` - cost, payoff, opportunity cost, cheaper 80/20 version
(If the plain names are not found, use the plugin-qualified names `council:believer`, `council:skeptic`, `council:investor`.)
Run them in the foreground (you need their answers for the next step).

## 3. Ruling
Launch `judge` (or `council:judge`) with the brief plus the three arguments verbatim. If a key fact is disputed and you can check it cheaply yourself (a grep, a file read), check it first and include the result for the Judge.

## 4. Report to the user
Show a compact summary, not the full transcripts:
- **Believer** - 1-2 lines + confidence
- **Skeptic** - top risk + risk level
- **Investor** - verdict + cheaper path if any
- **Judge's ruling** - ruling, why, next steps, confidence

Then ask whether to proceed with the Judge's next steps (do not start changing things on your own).

## Role cheat-sheet (also used in LITE MODE)
- **Believer:** best honest case for; best version of the idea; admits its biggest risk; CONFIDENCE %.
- **Skeptic:** hidden assumptions (checked/plausible/doubtful); pre-mortem top 3; side effects; root cause or symptom; quickest test; RISK level.
- **Investor:** cost S/M/L/XL; payoff; opportunity cost; 80/20 path; reversibility; VERDICT invest / cheap version / hold / pass.
- **Judge:** weighs evidence over confidence; GO / GO WITH CHANGES / NOT YET / NO-GO; why; conditions; numbered next steps; CONFIDENCE %.
