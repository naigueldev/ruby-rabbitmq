#!/usr/bin/env ruby
require "bunny"

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
queue1 = channel.queue("images.archive")
queue2 = channel.queue("images.crop")
queue3 = channel.queue("images.resize")

puts " [*] Waiting for messages. To exit press CTRL+C"
queue1.subscribe do |info, metadata, body|
  puts " [x] Received images.archive : #{body}"
end

queue2.subscribe do |info, metadata, body|
  puts " [x] Received images.crop : #{body}"
end

queue3.subscribe(block: true) do |info, metadata, body|
  puts " [x] Received images.resize : #{body}"
end
