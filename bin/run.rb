require_relative '../config/environment'
require 'pry'



prompt = TTY::Prompt.new


zip = prompt.ask('Welcome! Please enter your ZIP Code:')
type = prompt.ask('What type of food would you like?')
# if prompt.yes?("Would you like delivery?")
#     delivery = true
#     else delivery = false
# end
#find a match by zip code search
zip_results = Restaurant.find_by_zip(zip.to_s)
#find a match by type of food
type_results = Restaurant.find_by_type(type.to_s)
#find a match by delivery
# delivery_results = Restaurant.find_by_delivery(delivery)





grouped_results = zip_results & type_results

# full_results = grouped_results.select{|result| grouped_results.count(result) > 2}
#binding.pry
names = grouped_results.uniq.map{|restaurant| restaurant.name}

puts "Here are the restaurants that matched your search:"
if names.length == 0
    puts "No restaurants matched your search"
    exit
else
puts names
end
selection = prompt.select("Where would you like to eat?", names)
#find restaurant object from name
selection_object = Restaurant.find_by_name(selection)

 if prompt.yes?("Would you like to make a reservation?")
    user_name = prompt.ask("Please enter your name:")
    user_phone_number = prompt.ask("Please enter your phone number:")
    if selection_object.if_delivery?
    stay_or_go = prompt.select("Would you like to eat in or order delivery?", %w(Eat_In Delivery))
    else stay_or_go = "Eat in"
    end
    user = User.create(name: user_name, phone_number: user_phone_number)
    reservation = Reservation.create(user: user, restaurant: selection_object)
    puts "Your reservation has been created: #{stay_or_go} for #{user.name} at #{selection}."
 end
# if selection_object.if_delivery?
#     stay_or_go = prompt.select("Would you like to make a reservation or order delivery?", %w(Reservation Delivery))
#     if stay_or_go == "Reservation"
#         Reservation.create(user_id: nil, restaurant_id: nil)
#     else
#         puts "Ordering delivery from #{selection}."
#     end
# elsif prompt.yes?("Would you like to make a reservation?")
#         Reservation.create(user_id: nil, restaurant_id: nil)
# end


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