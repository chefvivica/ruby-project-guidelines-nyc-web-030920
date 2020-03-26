class CreateReservations < ActiveRecord::Migration
    def change
        create_table :reservations do |t|
        t.references :user, foreign_key: true
        t.references :restaurant, foreign_key: true
        end
    end
end