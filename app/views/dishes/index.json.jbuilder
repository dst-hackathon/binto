json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :restaurant_name, :price
  json.image_code dish.image_code.url
  json.url dish_url(dish, format: :json)
end
