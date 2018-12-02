require 'net/http'
require 'json'
require 'pp'

url = URI("https://raw.githubusercontent.com/ngryman/lol-items/master/items.json")
get_url = Net::HTTP.get(url)
lol_item_parse = JSON.parse(get_url)
puts Item.first.inspect