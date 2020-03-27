class RemoveColumnsFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :reservation_date
    remove_column :reservations, :reservation_time
  end
end
