# https://www.rabbitmq.com/install-windows-manual.html
# https://www.rabbitmq.com/install-windows.html

Write-Host "Installing RabbitMQ..." -ForegroundColor Cyan

Write-Host "Downloading..."
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$zipPath = "$env:TEMP\rabbitmq-server.zip"
Invoke-WebRequest -Uri $env:rabbit_download_url -OutFile $zipPath

Write-Host "Installing..."
Expand-Archive -Path $zipPath -DestinationPath "c:\\"
Remove-Item -Force $zipPath
Rename-Item c:\rabbitmq_server-$env:RMQ_VERSION c:\rabbitmq

Write-Host "RabbitMQ installed" -ForegroundColor Green

Write-Host "Installing RabbitMQ plugins..." -ForegroundColor Cyan

Write-Host "Downloading..."
$zipPath = "$env:TEMP\delayed_message_exchange.zip"
Invoke-WebRequest -Uri $env:delayed_message_exchange_url -OutFile $zipPath

Write-Host "Installing..."
Expand-Archive -Path $zipPath -DestinationPath "c:\rabbitmq\plugins"
Remove-Item -Force $zipPath

Write-Host "Enabling plugins..."
& "c:\rabbitmq\sbin\rabbitmq-plugins.bat" enable rabbitmq_delayed_message_exchange --offline
& "c:\rabbitmq\sbin\rabbitmq-plugins.bat" enable rabbitmq_management --offline

Set-Content -Path 'c:\rabbitmq.config' -Value '[{rabbit, [{loopback_users, []}]}].'

New-Item -ItemType Directory -Path "c:\Users\$env:USERNAME\AppData\Roaming\RabbitMQ"

Write-Host "RabbitMQ plugins installed" -ForegroundColor Green