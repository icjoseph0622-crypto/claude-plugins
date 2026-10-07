---
description: Save a short handoff note, so you can /clear and keep going in a fresh (much cheaper) context.
---

Every message in a long chat re-sends the whole history, so a fresh context is far cheaper. Write a handoff note that lets a brand-new session continue without re-exploring.

Write it to `%USERPROFILE%\.claude\handoff.md` (on Mac/Linux `~/.claude/handoff.md`), max 30 lines, plain bullets:
- **Goal:** what the user is working toward.
- **State:** what is done and verified, what is half-done.
- **Next steps:** numbered, concrete.
- **Key facts:** file paths, script paths, IDs, commands, gotchas you learned the hard way.
- **User prefs** that matter for the next steps.
No code dumps, no history narration.
Extra notes from the user (if any): $ARGUMENTS

Then reply with exactly one line: "Handoff saved - run /clear and just say 'continue'."
