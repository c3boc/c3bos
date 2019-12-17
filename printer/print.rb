# frozen_string_literal: true

require 'httparty'
require 'erb'

# list_url = 'http://localhost:5000/api/v1/print'
list_url = 'https://c3boc.de/api/v1/print'
printer = '/dev/printer'

template = %(


  ====== BOC Order ======

  ID: <%= id %>
  Location: <%= user %>
  Date: <%= created_at %>
  ==== Order Details ====
  <% for item in order_items %>
  * <%= item["amount"] %>x <%= item["beverage"] %>
  <% end %>
=======================
).gsub(/^  /, '')

response = HTTParty.get(list_url)
orders = JSON.parse(response.parsed_response)
orders.each do |order|
  message = ERB.new(template, 0, trim_mode: '%<>')
  order['order_items'].reject! { |item| item['amount'].nil? }
  result = message.result_with_hash(order)
  File.open(printer, 'w') do |f|
    f.write(result)
    f.write("\035\126\102\002")
  end
  ack_url = "https://c3boc.de/api/v1/print/#{order['id']}"
  puts ack_url
  puts HTTParty.get(ack_url)
end
