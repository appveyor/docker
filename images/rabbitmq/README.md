# Using RabbitMQ image

## Building image

```posh
docker build --rm -t appveyor/rabbitmq-windows .
```

## Running RabbitMQ container

```posh
docker run --rm --name rabbit1 -h my-rabbit1 -p 15672:15672 -v rmq-data:c:\rmq-data -d appveyor/rabbitmq-windows
```
