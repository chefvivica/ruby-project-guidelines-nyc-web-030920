class AddReservationDateToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :reservation_date, :date
    add_column :reservations, :reservation_time, :datetime
  end
end
