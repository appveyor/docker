# base ideas from here: https://github.com/gsx-solutions/rmq-win

FROM microsoft/windowsservercore:ltsc2016 as root

COPY . /install

ENV erlang_download_url="http://erlang.org/download/otp_win64_20.3.exe" \
    ERLANG_HOME="c:\\erlang" \
    RMQ_VERSION="3.7.5" \
    rabbit_download_url="https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.5/rabbitmq-server-windows-3.7.5.zip" \
    delayed_message_exchange_url="https://bintray.com/rabbitmq/community-plugins/download_file?file_path=3.7.x%2Frabbitmq_delayed_message_exchange%2Frabbitmq_delayed_message_exchange-20171201-3.7.x.zip" \
    RABBITMQ_CONFIG_FILE="c:\rabbitmq" \
    RABBITMQ_BASE="c:\\rmq-data"

VOLUME ${RABBITMQ_BASE}

RUN powershell ./install/install_erlang.ps1
RUN powershell ./install/install_rabbitmq.ps1

# Ports
# 4369: epmd, a peer discovery service used by RabbitMQ nodes and CLI tools
# 5672: used by AMQP 0-9-1 and 1.0 clients without TLS
# 5671: used by AMQP 0-9-1 and 1.0 clients with TLS
# 25672: used by Erlang distribution for inter-node and CLI tools communication and is allocated from a dynamic range (limited to a single port by default, computed as AMQP port + 20000).
# 15672: HTTP API clients and rabbitmqadmin (only if the management plugin is enabled)
EXPOSE 4369 5671 5672 25672 15672

CMD ["c:\\install\\start.bat"]