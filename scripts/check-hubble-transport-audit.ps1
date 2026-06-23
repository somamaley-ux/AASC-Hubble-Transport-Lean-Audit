param(
  [switch]$SkipLakeUpdate
)

$ErrorActionPreference = "Stop"

Write-Host "== Hubble transport Lean audit =="
Write-Host "Repository: $PSScriptRoot\.."
Set-Location (Join-Path $PSScriptRoot "..")

Write-Host "`n== Lean toolchain =="
Get-Content .\lean-toolchain
lake --version

Write-Host "`n== Dependency pins =="
Get-Content .\lakefile.toml

if (-not $SkipLakeUpdate) {
  Write-Host "`n== Lake update =="
  try {
    lake update
  } catch {
    Write-Host "Lake update failed; attempting ProofWidgets release fallback used by AASC endpoint archives."
    $proofwidgetsTar = ".lake\packages\proofwidgets\.lake\ProofWidgets4.tar.gz"
    $proofwidgetsBuild = ".lake\packages\proofwidgets\.lake\build"
    New-Item -ItemType Directory -Force -Path (Split-Path $proofwidgetsTar) | Out-Null
    Invoke-WebRequest `
      -Uri "https://github.com/leanprover-community/ProofWidgets4/releases/download/v0.0.87/ProofWidgets4.tar.gz" `
      -OutFile $proofwidgetsTar `
      -UseBasicParsing
    New-Item -ItemType Directory -Force -Path $proofwidgetsBuild | Out-Null
    tar -xzf $proofwidgetsTar -C $proofwidgetsBuild
    lake update
  }
}

Write-Host "`n== Project-level declaration scan =="
$scanRoots = @("HubbleTransport", "MaleyLean", "Checks\Axiom")
$bad = @()
foreach ($root in $scanRoots) {
  if (Test-Path $root) {
    $leanFiles = Get-ChildItem -Path $root -Recurse -Filter "*.lean" -File
    if ($leanFiles.Count -gt 0) {
      $bad += $leanFiles | Select-String `
        -Pattern '^\s*(axiom|unsafe|sorry|admit)\b' `
        -ErrorAction SilentlyContinue
    }
  }
}
if ($bad.Count -gt 0) {
  $bad | Format-Table -AutoSize
  throw "Found live project-level axiom/sorry/admit/unsafe declaration."
}
Write-Host "No live project-level axiom/sorry/admit/unsafe declaration found."

Write-Host "`n== Build HubbleTransport =="
lake build HubbleTransport

Write-Host "`n== Focused axiom check =="
lake env lean Checks\Axiom\HubbleTransportAxiomCheck.lean

Write-Host "`n== Audit complete =="
