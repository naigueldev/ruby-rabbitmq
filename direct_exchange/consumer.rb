require "rubygems"
require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.direct("images-microservice")
queue1 = channel.queue("queue-images-archive").bind(exchange, :routing_key => "images.archive")
queue2 = channel.queue("queue-images-crop").bind(exchange, :routing_key => "images.crop")
queue3 = channel.queue("queue-images-resize").bind(exchange, :routing_key => "images.resize")

puts " [*] Waiting for messages. To exit press CTRL+C"

begin
  queue1.subscribe do |info, metadata, body|
    puts " [x] Received images.archive : #{body}"
    puts "========================================================="
  end

  queue2.subscribe do |info, metadata, body|
    puts " [x] Received images.crop : #{body}"
    puts "========================================================="
  end

  queue3.subscribe(block: true) do |info, metadata, body|
    puts " [x] Received images.resize : #{body}"
    puts "========================================================="
  end
rescue Interrupt => _
  exit(0)
end
