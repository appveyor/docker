Write-Host "Installing RabbitMQ..." -ForegroundColor Cyan

Write-Host "Downloading..."
$exePath = "$($env:USERPROFILE)\rabbitmq-server-3.6.5.exe"
(New-Object Net.WebClient).DownloadFile('http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.5/rabbitmq-server-3.6.5.exe', $exePath)

Write-Host "Installing..."
cmd /c start /wait $exePath /S

Write-Host "RabbitMQ installed and started" -ForegroundColor Green



Write-Host "Installing RabbitMQ plugins..." -ForegroundColor Cyan

Write-Host "Downloading..."
$pluginPath = "C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.5\plugins\rabbitmq_delayed_message_exchange-0.0.1.ez"
(New-Object Net.WebClient).DownloadFile('https://bintray.com/rabbitmq/community-plugins/download_file?file_path=rabbitmq_delayed_message_exchange-0.0.1.ez', $pluginPath)

Write-Host "Installing..."
& "C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.5\sbin\rabbitmq-plugins.bat" enable rabbitmq_delayed_message_exchange --offline

Write-Host "RabbitMQ plugins installed and started" -ForegroundColor Green