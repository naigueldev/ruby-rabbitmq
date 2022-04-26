#!/usr/bin/env ruby
require "bunny"
require "date"

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
queue = channel.queue("hello")
message = "Hello World! #{DateTime.now}"
channel.default_exchange.publish(message, routing_key: queue.name)
puts " [x] Sent #{message}"

connection.close
