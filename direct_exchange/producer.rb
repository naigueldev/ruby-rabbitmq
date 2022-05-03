#!/usr/bin/env ruby
require "bunny"
require "date"
require "json"

connection = Bunny.new()
connection.start

channel = connection.create_channel
@exchange = channel.direct("images-microservice")

def send_message(routing_key, message)
  @exchange.publish(message, routing_key: routing_key)
  puts " [x] Sent #{message}"
end

queue = channel.queue("queue-images-archive")
message = { message: "Hello World! #{DateTime.now}", queue: queue.name }.to_json
routing_key = "images.archive"
send_message(routing_key, message)

queue = channel.queue("queue-images-crop")
message = { message: "Hello World! #{DateTime.now}", queue: queue.name }.to_json

routing_key = "images.crop"
send_message(routing_key, message)

queue = channel.queue("queue-images-resize")
message = { message: "Hello World! #{DateTime.now}", queue: queue.name }.to_json

routing_key = "images.resize"
send_message(routing_key, message)

connection.close
