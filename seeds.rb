require 'rest-client'
require 'pry'
require 'JSON'
# require_relative './config'
# require_relative './app'
User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all
# yelp_search = RestClient.get("https://api.yelp.com/v3/businesses/search")
# parsed_data = JSON.parse(yelp_search)

user1 = User.new(name: "User1")
user2 = User.new(name: "User2")
restaurant1 = Restaurant.new(name: "restaurant1name", location: "location1")
restaurant2 = Restaurant.new(name: "restaurant2name", location: "location2")
reservation1 = Reservation.new(user: user1, restaurant: restaurant1)
reservation2 = Reservation.new(user: user2, restaurant: restaurant2)

binding.pry
# parsed_data.each do |restaurant| 
# Restaurant.create(name: restaurant["name"], location: restaurant["location"])
# end