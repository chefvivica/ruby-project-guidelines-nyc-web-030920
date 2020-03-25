require 'pry'
require 'JSON'
User.destroy_all
Restaurant.destroy_all
Reservation.destroy_all
# yelp_search = RestClient.get("https://api.yelp.com/v3/businesses/search")
# parsed_data = JSON.parse(yelp_search)

user1 = User.create(name: "User1")
user2 = User.create(name: "User2")
restaurant1 = Restaurant.create(name: "restaurant1name", location: "location1")
restaurant2 = Restaurant.create(name: "restaurant2name", location: "location2")
reservation1 = Reservation.create(user: user1, restaurant: restaurant1)
reservation2 = Reservation.create(user: user2, restaurant: restaurant2)

#binding.pry
# parsed_data.each do |restaurant| 
# Restaurant.create(name: restaurant["name"], location: restaurant["location"])
# end