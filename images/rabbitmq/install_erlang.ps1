[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host "Installing Erlang..." -ForegroundColor Cyan

Write-Host "Downloading..."
$exePath = "$env:TEMP\erlang_install.exe"
Invoke-WebRequest -Uri $env:erlang_download_url -OutFile $exePath

Write-Host "Installing..."
cmd /c start /wait $exePath /S /D="$env:ERLANG_HOME"
Remove-Item $exePath

Write-Host "Installed Erlang" -ForegroundColor Green