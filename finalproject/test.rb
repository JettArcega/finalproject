require 'net/http'
require 'json'
require 'pp'

url = URI("https://raw.githubusercontent.com/ngryman/lol-items/master/items.json")
get_url = Net::HTTP.get(url)
lol_item_parse = JSON.parse(get_url)
count = 0
lol_item_parse.each do |i|
    if i['price']['total'] == 0
        puts "#{ i['name'] } was not included."
    else
        count += 1
    end
    # puts "#{i['name']} #{i['price']}"
end

puts count