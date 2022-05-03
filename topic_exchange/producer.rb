#!/usr/bin/env ruby
require "bunny"
require "date"
require "json"

connection = Bunny.new
connection.start

@channel = connection.create_channel

def send_message(message, routing_key)
  @channel.topic("news").publish(message, routing_key: routing_key)
  puts " [x] Sent #{message} , routing key = #{routing_key}"
end

message = { message: "Hello World! #{DateTime.now}" }.to_json
routing_key = "world.politics.internet.cybercime.brazil.south"
send_message(message, routing_key)

routing_key = "world.sports"
send_message(message, routing_key)

routing_key = "world.business.crypto"
send_message(message, routing_key)

connection.close
