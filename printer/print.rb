# frozen_string_literal: true

require 'httparty'
require 'erb'

#api_url_root = 'http://localhost:3000/api/v1'
api_url_root = 'https://c3boc.de/api/v1'

#list_url = api_url_root + '/print'
printer = '/dev/usb/lp0'
image = File.read('gnomus.bin')

template = %(


\xc9\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xbb
\xba            BOC Order            \xba 
\xc8\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xbc

 ID: <%= id %>
 Location: <%= user %>    
 Date: <%= created_at %>

\xc9\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xbb
\xba          Order Details          \xba 
\xc8\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xbc

<% for item in order_items %>
 * <%= item["amount"] %>x <%= item["beverage"] %>
<% end %>


)

while true
  begin
    response = HTTParty.get(list_url)
    orders = JSON.parse(response.parsed_response)
    orders.each do |order|
      message = ERB.new(template, 0, trim_mode: '%<>')
      order['order_items'].reject! { |item| item['amount'].nil? }
      result = message.result_with_hash(order)
      File.open(printer, 'w') do |f|
        f.write(image)
        f.write(result)
        f.write("\035\126\102\002")
      end
      ack_url = api_url_root + "/print/#{order['id']}"
      puts ack_url
      puts HTTParty.get(ack_url)
    end
  rescue
    puts "Error fetching Orders"
  end
  sleep 30
end
