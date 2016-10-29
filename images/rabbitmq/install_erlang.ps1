Write-Host "Installing Erlang..." -ForegroundColor Cyan

Write-Host "Downloading..."
$exePath = "$($env:USERPROFILE)\otp_win64_19.1.exe"
(New-Object Net.WebClient).DownloadFile('http://erlang.org/download/otp_win64_19.1.exe', $exePath)

Write-Host "Installing..."
cmd /c start /wait $exePath /S
del $exePath

$env:path = "$env:path;C:\Program Files\erl8.1\bin"

[Environment]::SetEnvironmentVariable('ERLANG_HOME', 'C:\Program Files\erl8.1', 'Machine')
$env:ERLANG_HOME="C:\Program Files\erl8.1"

# C:\Program Files\erl8.1

$x64items = @(Get-ChildItem "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall")
$x64items + @(Get-ChildItem "HKLM:SOFTWARE\wow6432node\Microsoft\Windows\CurrentVersion\Uninstall") `
    | ForEach-object { Get-ItemProperty Microsoft.PowerShell.Core\Registry::$_ } `
    | Where-Object { $_.DisplayName -and $_.DisplayName.contains('Erlang') } `
    | Sort-Object -Property DisplayName `
    | Select-Object -Property DisplayName,DisplayVersion

Write-Host "Installed Erlang" -ForegroundColor Green