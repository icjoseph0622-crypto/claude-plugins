---
description: Run a coding task through the dev council. Add "full" to force Tier 2 (agents), "lite" to force the inline council.
---

Task: $ARGUMENTS

Follow the `genius-mode` skill. If the task starts with `full`, use Tier 2; with `lite`, use Tier 1; otherwise pick the tier yourself and state it.

Tier 2 order: brief (under 200 words, file:line refs) -> `genius-dev:architect` if structure is unclear -> implement (yourself, or `genius-dev:implementer` for a large isolated piece) -> in ONE message, the 1-3 matching reviewers from: `genius-dev:bug-hunter`, `genius-dev:security-reviewer`, `genius-dev:performance-reviewer`, `genius-dev:test-engineer`, `genius-dev:code-reviewer`, `genius-dev:artist`, `genius-dev:consumer` -> as Lead, rule on conflicts, apply the fixes worth making, verify.

Finish with a short report: **Tier**, **Council verdicts** (one line per role used), **Lead's rulings**, **Changed**, **Verified / not verified**.
