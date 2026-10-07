# token-saver: printed text becomes context at the start of every session (kept tiny on purpose)
$ErrorActionPreference = 'SilentlyContinue'

@"
TOKEN SAVER ON - the user pays per token. Work lean:
1. Short answers. No recaps of what you did, no restating the question, no surveys of options you won't use.
2. Locate first (Grep/Glob, memory-vault index), then Read only the needed line ranges. Never re-read a file you already read or just edited.
3. Put independent tool calls in ONE message. Plan the next 2-3 steps before acting.
4. No subagents unless the user asks - do it inline.
5. Small targeted edits, never rewrite whole files to change a few lines.
6. Prefer text tools (page text, console output, grep) over screenshots; if you must screenshot, use a reduced scale.
7. Keep command output short (filter, Select-Object -First, head_limit).
8. When a big task is finished or the chat is long, suggest /handoff then /clear.
"@

# one-shot handoff note from the previous session (written by /handoff)
$dir = Join-Path $env:USERPROFILE '.claude'
$note = Join-Path $dir 'handoff.md'
if (Test-Path -LiteralPath $note) {
    $age = (Get-Date) - (Get-Item -LiteralPath $note).LastWriteTime
    if ($age.TotalHours -lt 48) {
        "`nHANDOFF FROM THE LAST SESSION (continue from here, don't re-explore what it already says):"
        Get-Content -LiteralPath $note -TotalCount 40
    }
    Move-Item -LiteralPath $note -Destination (Join-Path $dir 'handoff.used.md') -Force
}
exit 0
