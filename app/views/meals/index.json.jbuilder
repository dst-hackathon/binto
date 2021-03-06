json.array!(@meals) do |meal|
  json.extract! meal, :consumer_name, :consumer_id, :dish_image_code, :dish_name, :dish_id, :meal_date, :restaurant_name, :restaurant_image_code, :restaurant_id
  json.url meal_url(meal, format: :json)
end
