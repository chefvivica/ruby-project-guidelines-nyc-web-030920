class Restaurant < ActiveRecord::Base
    has_many :restaurants
    has_many :users, through: :resevations 
end 