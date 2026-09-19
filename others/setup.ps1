$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot

$subs = @(
    @{
        Name = "rime-ice"
        List = "rime-ice-sparse.txt"
    },
    @{
        Name = "rime-kagiroi"
        List = "rime-kagiroi-sparse.txt"
    },
    @{
        Name = "RIME-LMDG"
        List = "RIME-LMDG-sparse.txt"
    }
)

foreach ($s in $subs) {
    $sub = Join-Path $root $s.Name
    $list = Join-Path $PSScriptRoot $s.List

    if (-not (Test-Path $list)) {
        throw "Missing: $list"
    }

    git -C $root submodule update --init --recursive $s.Name
    if ($LASTEXITCODE) { exit $LASTEXITCODE }

    git -C $sub sparse-checkout init --no-cone
    if ($LASTEXITCODE) { exit $LASTEXITCODE }

    Get-Content $list |
    Where-Object { $_.Trim() -and -not $_.Trim().StartsWith("#") } |
    git -C $sub sparse-checkout set --stdin

    if ($LASTEXITCODE) { exit $LASTEXITCODE }
}

Write-Host "Done."