class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :image_code
      t.decimal :price, :precision => 6, :scale => 2
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
