class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_code
      t.integer :dish_id

      t.timestamps
    end
  end
end
