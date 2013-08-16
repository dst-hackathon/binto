json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :image_code, :dish_id
  json.url restaurant_url(restaurant, format: :json)
end
