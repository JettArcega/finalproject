# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
require 'net/http'
require 'json'
require 'pp'

url = URI("https://raw.githubusercontent.com/ngryman/lol-items/master/items.json")
get_url = Net::HTTP.get(url)
lol_item_parse = JSON.parse(get_url)

Item.delete_all

lol_item_parse.each do |i|
    if i['price']['total'] == 0
        puts "#{ i['name'] } was not included."
    else
        stats = "N/A"
        i['stats'].each do |s|
            stats = "#{s.first}: #{s.second}"
        end
        Item.create(name: i['name'],
            description: i['plaintext'],
            tag: i['tags'],
            stats: stats,
            stock: Faker::Number.between(5,20),
            price: i['price']['total'])
    end
end

puts Item.count