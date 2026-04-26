$ErrorActionPreference = "Stop"

$sourceDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$installDir = Join-Path $env:LOCALAPPDATA "SOPBatchGenerator"
$programsDir = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs"
$desktopShortcut = Join-Path ([Environment]::GetFolderPath("Desktop")) "SOP Batch Generator.lnk"
$startShortcut = Join-Path $programsDir "SOP Batch Generator.lnk"
$exePath = Join-Path $installDir "SOPBatchGenerator.exe"

New-Item -ItemType Directory -Force -Path $installDir | Out-Null
Copy-Item -LiteralPath (Join-Path $sourceDir "app.exe") -Destination $exePath -Force
Copy-Item -LiteralPath (Join-Path $sourceDir "ffmpeg.exe") -Destination (Join-Path $installDir "ffmpeg.exe") -Force
Copy-Item -LiteralPath (Join-Path $sourceDir "readme.txt") -Destination (Join-Path $installDir "README.txt") -Force
Copy-Item -LiteralPath (Join-Path $sourceDir "uninstall.ps1") -Destination (Join-Path $installDir "uninstall.ps1") -Force

$shell = New-Object -ComObject WScript.Shell
foreach ($shortcutPath in @($desktopShortcut, $startShortcut)) {
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $exePath
    $shortcut.WorkingDirectory = $installDir
    $shortcut.IconLocation = $exePath
    $shortcut.Description = "SOP Batch Generator"
    $shortcut.Save()
}

Start-Process -FilePath $exePath -WorkingDirectory $installDir
