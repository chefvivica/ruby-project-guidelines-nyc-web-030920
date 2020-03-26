class Restaurant < ActiveRecord::Base
    has_many :restaurants
    has_many :users, through: :reservations 
    def self.find_by_zip(zip)
        self.all.select{|restaurant| restaurant.location == zip}
    end
    def self.find_by_type(type)
        self.all.select{|restaurant| restaurant.food_type == type}
    end
    def self.find_by_delivery(delivery)
        self.all.select{|restaurant| restaurant.if_delivery? == true}
    end
end 