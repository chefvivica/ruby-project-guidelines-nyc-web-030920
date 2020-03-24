require 'rest-client'
require 'pry'
require 'JSON'
yelp_search = RestClient.get("https://api.yelp.com/v3/businesses/search")
parsed_data = JSON.parse(yelp_search)
parsed_data.each do |restaurant| 
Restaurant.create(name: restaurant["name"], location: restaurant["location"])
end