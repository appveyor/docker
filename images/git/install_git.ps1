Write-Host "Installing Git..." -ForegroundColor Cyan

$exePath = "$env:TEMP\Git-2.8.2-64-bit.exe"

Write-Host "Downloading..."
(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.8.2.windows.1/Git-2.8.2-64-bit.exe', $exePath)

Write-Host "Installing..."
cmd /c start /wait $exePath /VERYSILENT /NORESTART /NOCANCEL /SP- /NOICONS /COMPONENTS="icons,icons\quicklaunch,ext,ext\reg,ext\reg\shellhere,ext\reg\guihere,assoc,assoc_sh" /LOG
del $exePath

$path = [Environment]::GetEnvironmentVariable("PATH", "Machine")
[Environment]::SetEnvironmentVariable("PATH", "$path;$env:ProgramFiles\Git\cmd;$env:ProgramFiles\Git\usr\bin", "Machine")

$env:path = "$env:path;$env:ProgramFiles\Git\cmd;$env:ProgramFiles\Git\usr\bin"

git --version
Write-Host "Git installed" -ForegroundColor Green