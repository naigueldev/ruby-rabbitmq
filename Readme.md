# Ruby-RabbitMQ

### Run RabbitMQ container

```
docker run -d --hostname my-rabbit --name rabbit13 -p 8080:15672 -p 5672:5672 -p 25676:25676 rabbitmq:3-management
```

### Exchanges types:

* Default
* Direct
* Fanout
* Topic

### Run the consumer:

`ruby <exchange_type>_exchange/consumer.rb`


### Run the producer:

`ruby <exchange_type>_exchange/producer.rb`

References: 
- [RabbitMQ with docker](https://medium.com/xp-inc/rabbitmq-com-docker-conhecendo-o-admin-cc81f3f6ac3b)
- [RabbitMQ Ruby Tutorials](https://www.rabbitmq.com/tutorials/tutorial-one-ruby.html)
- [Ruby Bunny-RabbitMQ DevCast](https://www.youtube.com/watch?v=6W3YqdtiyUI&ab_channel=DevCasts)