require_relative '../config/environment'
require 'pry'



prompt = TTY::Prompt.new
zip = prompt.ask('Welcome! Please enter your ZIP Code:')
type = prompt.ask('What type of food would you like?')
if prompt.yes?("Would you like delivery?") do
    delivery = true
    end
    else delivery = false
    end


zip_results = Restaurant.find_by_zip(zip.to_s)
type_results = Restaurant.find_by_type(type.to_s)
delivery_results = Restaurant.find_by_delivery(delivery)
full_results = zip_results + type_results + delivery_results
names = full_results.uniq.map{|restaurant| restaurant.name}
puts "Here are the restaurants that matched your search:"
puts names
