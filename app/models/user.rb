class User < ActiveRecord::Base
    has_many :users
    has_many :restaurants, through: :reservations 
end
