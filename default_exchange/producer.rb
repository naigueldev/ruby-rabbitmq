#!/usr/bin/env ruby
require "bunny"
require "date"
require "json"

connection = Bunny.new
connection.start

@channel = connection.create_channel

def send_message(queue, message)
  @channel.default_exchange.publish(message, routing_key: queue.name)
  puts " [x] Sent #{message}"
end

queue = @channel.queue("images.archive")
message = { message: "Hello World! #{DateTime.now}", queue: queue.name }.to_json

send_message(queue, message)

queue = @channel.queue("images.crop")
message = { message: "Hello World! #{DateTime.now}", queue: queue.name }.to_json

send_message(queue, message)

queue = @channel.queue("images.resize")
message = { message: "Hello World! #{DateTime.now}", queue: queue.name }.to_json

send_message(queue, message)

connection.close
