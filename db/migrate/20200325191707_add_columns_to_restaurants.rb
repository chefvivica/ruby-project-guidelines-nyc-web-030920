class AddColumnsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :opening_time, :datetime
    add_column :restaurants, :closing_time, :datetime
    add_column :restaurants, :price_range, :float
    add_column :restaurants, :if_delivery?, :boolean
  end
end
