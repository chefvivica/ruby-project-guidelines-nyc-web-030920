class CreateReservations < ActiveRecord::Migration
    def change
        create_table :reservations do |t|
        t.integer :user_key
        t.integer :restaurant_key
        end
    end
end