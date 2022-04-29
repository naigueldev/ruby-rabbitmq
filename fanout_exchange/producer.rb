#!/usr/bin/env ruby
require "bunny"
require "date"
require "json"

connection = Bunny.new(automatically_recover: false)
connection.start

@channel = connection.create_channel

def send_message(message)
  @channel.fanout("images").publish(message)
  puts " [x] Sent #{message}"
end

message = { message: "Hello World! #{DateTime.now}" }.to_json

send_message(message)

connection.close
