$ErrorActionPreference = "SilentlyContinue"

$installDir = Join-Path $env:LOCALAPPDATA "SOPBatchGenerator"
$programsDir = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs"
$desktopShortcut = Join-Path ([Environment]::GetFolderPath("Desktop")) "SOP Batch Generator.lnk"
$startShortcut = Join-Path $programsDir "SOP Batch Generator.lnk"

Remove-Item -LiteralPath $desktopShortcut -Force
Remove-Item -LiteralPath $startShortcut -Force
Get-Process -Name "SOPBatchGenerator" | Stop-Process -Force
Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-NoProfile -Command Start-Sleep -Seconds 1; Remove-Item -LiteralPath '$installDir' -Recurse -Force"
