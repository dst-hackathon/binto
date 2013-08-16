class Meal < ActiveRecord::Base
	mount_uploader :dish_image_code, MealUploader
	mount_uploader :restaurant_image_code, MealUploader
end
