# RUBY-RABBITMQ

### Run RabbitMQ container

```
docker run -d --hostname my-rabbit --name rabbit13 -p 8080:15672 -p 5672:5672 -p 25676:25676 rabbitmq:3-management
```

### Run the consumer:

`ruby receive.rb`


### Run the publisher:

`ruby send.rb`