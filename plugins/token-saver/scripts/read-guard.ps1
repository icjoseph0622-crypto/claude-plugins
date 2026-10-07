# token-saver: blocks reading a HUGE file in one go (exit 2 = block, stderr goes back to Claude)
$ErrorActionPreference = 'SilentlyContinue'
$MAX_BYTES = 40000   # ~10k tokens
$MAX_LIMIT = 600     # biggest chunk allowed for large files

$data = [Console]::In.ReadToEnd() | ConvertFrom-Json
$in = $data.tool_input
$path = $in.file_path
if (-not $path -or -not (Test-Path -LiteralPath $path -PathType Leaf)) { exit 0 }

# images / pdfs / notebooks are handled by the Read tool's own paging
$ext = [IO.Path]::GetExtension($path).ToLower()
if (@('.png', '.jpg', '.jpeg', '.gif', '.webp', '.bmp', '.pdf', '.ipynb') -contains $ext) { exit 0 }

$size = (Get-Item -LiteralPath $path).Length
if ($size -le $MAX_BYTES) { exit 0 }
if ($in.limit -and [int]$in.limit -le $MAX_LIMIT) { exit 0 }

$lines = 0
foreach ($l in [IO.File]::ReadLines($path)) { $lines++ }
[Console]::Error.WriteLine("token-saver: $path is big ($lines lines, ~$([int]($size / 4)) tokens). Grep for the part you need, then Read with offset + limit (limit <= $MAX_LIMIT). Only page through the whole file if you truly need all of it.")
exit 2
