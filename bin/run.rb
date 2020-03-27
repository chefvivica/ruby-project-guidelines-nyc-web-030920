require_relative '../config/environment'
require 'pry'



prompt = TTY::Prompt.new

zip = prompt.ask('Welcome! Please enter your ZIP Code:')
type = prompt.ask('What type of food would you like?')
if prompt.yes?("Would you like delivery?")
    delivery = true
    else delivery = false
    end


zip_results = Restaurant.find_by_zip(zip.to_s)
type_results = Restaurant.find_by_type(type.to_s)
delivery_results = Restaurant.find_by_delivery(delivery)
binding.pry
grouped_results = zip_results + type_results + delivery_results

full_results = grouped_results.select{|result| grouped_results.count(result) > 2}
#binding.pry
names = full_results.uniq.map{|restaurant| restaurant.name}
puts "Here are the restaurants that matched your search:"
puts names
selection = prompt.select("Where would you like to eat?", names)
selection_object = Restaurant.find_by_name(selection)

if selection_object.if_delivery?
    stay_or_go = prompt.select("Would you like to make a reservation or order delivery?", %w(Reservation Delivery))
    if stay_or_go == "Reservation"
        time = prompt.ask("Please enter a date and time.")
        Reservation.create(user_id: nil, restaurant_id: nil, reservation_date: nil, reservation_time: time)
    else
        puts "Ordering delivery from #{selection}."
    end
elsif prompt.yes?("Would you like to make a reservation?")
    time = prompt.ask("Please enter a date and time.")
        Reservation.create(user_id: nil, restaurant_id: nil, reservation_date: nil, reservation_time: time)
end

binding.pry
#     if stay_or_go == Reservation do
#         time = prompt.ask("Please enter a date and time.")
#         Reservation.create(user_id: nil, restaurant_id: nil, reservation_date: nil, reservation_time: time)
#     end
#     elsif stay_or_go == Delivery do
#         puts "Ordering delivery from #{selection}"
#     end
# end
# if prompt.yes?("Would you like to make a reservation?")
#     time = prompt.ask("Please enter a date and time.")
#         Reservation.create(user_id: nil, restaurant_id: nil, reservation_date: nil, reservation_time: time)
# end
#     end
# end
# Reservation.create(user_id: customer_name, restaurant_id: selection_object)