json.array!(@dishes) do |dish|
  json.extract! dish, :name, :image_code, :restaurant_id, :restaurant_name
  json.url dish_url(dish, format: :json)
end
