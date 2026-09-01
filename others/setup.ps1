$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$sub = Join-Path $root "rime-ice"
$list = Join-Path $PSScriptRoot "rime-ice-sparse.txt"

if (-not (Test-Path $list)) {
    throw "Missing: $list"
}

git -C $root submodule update --init --recursive rime-ice
if ($LASTEXITCODE) { exit $LASTEXITCODE }

git -C $sub sparse-checkout init --no-cone
if ($LASTEXITCODE) { exit $LASTEXITCODE }

Get-Content $list |
Where-Object { $_.Trim() -and -not $_.Trim().StartsWith("#") } |
git -C $sub sparse-checkout set --stdin

if ($LASTEXITCODE) { exit $LASTEXITCODE }

Write-Host "Done."
