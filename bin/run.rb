require_relative '../config/environment'
require 'pry'

puts "Welcome! Please enter your ZIP Code:"
zip = gets.chomp
puts zip
results = Restaurant.all.select{|restaurant| restaurant.location == "#{zip}"}

puts "What type of food would you like?"
type = gets.chomp
type_results = results.select{|restaurant| restaurant.food_type == type}
puts "Would you like delivery? (True/False)"
delivery = gets.chomp
delivery_results = type_results.select{|restaurant| restaurant.if_delivery? == delivery}
puts "Here are the restaurants that matched your search:"
names = delivery_results.map{|restaurant| restaurant.name}


