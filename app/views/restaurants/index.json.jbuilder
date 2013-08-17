json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :image_code
  json.url restaurant_url(restaurant, format: :json)
end
