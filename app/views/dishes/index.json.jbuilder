json.array!(@dishes) do |dish|
  json.extract! dish, :name, :image_code, :restaurant_id
  json.url dish_url(dish, format: :json)
end
