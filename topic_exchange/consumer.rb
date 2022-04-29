#!/usr/bin/env ruby
require "bunny"

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
exchange = channel.topic("news")

puts " [*] Waiting for messages. To exit press CTRL+C"
channel.queue("").bind(exchange, routing_key: "world.politics.#").subscribe do |info, metadata, body|
  puts " [x] Received images.archive : #{body}, routing key => #{info.routing_key}"
end

channel.queue("").bind(exchange, routing_key: "world.sports").subscribe do |info, metadata, body|
  puts " [x] Received images.archive : #{body}, routing key => #{info.routing_key}"
end

channel.queue("").bind(exchange, routing_key: "world.business.*").subscribe(block: true) do |info, metadata, body|
  puts " [x] Received images.archive : #{body}, routing key => #{info.routing_key}"
end
