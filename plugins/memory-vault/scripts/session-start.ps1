# MEMORY VAULT - SessionStart hook
# Prints the vault INDEX (one short line per memory) so Claude knows what it has stored
# without reading every entry. Full entries are opened only when a task needs them.
$ErrorActionPreference = 'SilentlyContinue'
$vault = Join-Path $env:USERPROFILE '.claude\memory-vault'
$entries = Join-Path $vault 'entries'
$index = Join-Path $vault 'INDEX.md'
if (-not (Test-Path $entries)) { New-Item -ItemType Directory -Force -Path $entries | Out-Null }
if (-not (Test-Path $index)) {
  Set-Content -Path $index -Encoding utf8 -Value "# Memory Vault index`n# format: - <slug> | <tags> | <one-line summary>`n"
}

$lines = Get-Content -Path $index -Encoding utf8 | Where-Object { $_ -match '^\s*- ' }
$max = 80
$shown = $lines | Select-Object -First $max

Write-Output "MEMORY VAULT ($($lines.Count) memories) at $vault"
Write-Output "Index below = slug | tags | summary. Open entries\<slug>.md with Read ONLY when relevant to the current task (grep the index first; never read the whole vault)."
Write-Output "Use the memory-vault skill to save new durable facts (/remember) and to look things up (/recall)."
if ($shown.Count -gt 0) {
  $shown | ForEach-Object { Write-Output $_ }
  if ($lines.Count -gt $max) { Write-Output "... $($lines.Count - $max) more - grep INDEX.md by tag or keyword." }
} else {
  Write-Output "(vault is empty)"
}
exit 0
