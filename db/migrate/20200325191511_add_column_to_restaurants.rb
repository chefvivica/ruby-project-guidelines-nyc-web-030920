class AddColumnToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :food_type, :string
  end
end
