#!/usr/bin/env ruby
require "bunny"

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
exchange = channel.topic("news")

puts " [*] Waiting for messages. To exit press CTRL+C"

begin
  channel.queue("news-world-politics").bind(exchange, routing_key: "world.politics.#").subscribe do |info, metadata, body|
    puts " [x] Received images.archive : #{body}, routing key => #{info.routing_key}"
    puts "============================================================================="
  end

  channel.queue("news-world-sports").bind(exchange, routing_key: "world.sports").subscribe do |info, metadata, body|
    puts " [x] Received images.archive : #{body}, routing key => #{info.routing_key}"
    puts "============================================================================="
  end

  channel.queue("news-world-business").bind(exchange, routing_key: "world.business.*").subscribe(block: true) do |info, metadata, body|
    puts " [x] Received images.archive : #{body}, routing key => #{info.routing_key}"
    puts "============================================================================="
  end
rescue Interrupt => _
  exit(0)
end
