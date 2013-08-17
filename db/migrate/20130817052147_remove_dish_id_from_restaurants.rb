class RemoveDishIdFromRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :dish_id, :string
  end
end
