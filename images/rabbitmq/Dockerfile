FROM microsoft/windowsservercore

COPY . /install

RUN powershell ./install/install_erlang
RUN powershell ./install/install_rabbitmq

CMD ["C:\\Program Files\\RabbitMQ Server\\rabbitmq_server-3.6.5\\sbin\\rabbitmq-server.bat"]