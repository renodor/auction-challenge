# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

content = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis officiis expedita cupiditate ipsa accusamus eius possimus porro vero perspiciatis ipsum nulla excepturi, non, rem numquam quasi similique facere et deleniti."

p 'Destroy all auctions'
Auction.destroy_all
p '----------> done'

10.times do |n|
  Auction.create!(title: Faker::DcComics.hero, content: content, price: rand(50) + rand.round(2))
  p "auction #{n + 1} created!"
end

p "----------> done, #{Auction.count} auctions created"
