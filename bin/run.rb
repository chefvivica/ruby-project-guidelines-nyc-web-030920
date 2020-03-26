require_relative '../config/environment'

puts "Welcome! Please enter your ZIP Code:"
zip = gets.chomp
results = Restaurant.all.select{|restaurant| restaurant.location == zip}
names = results.map{|restaurant| restaurant.name}
puts "Here are the restaurants in your area:"
puts names
