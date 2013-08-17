class Meal < ActiveRecord::Base
	mount_uploader :dish_image_code, MealUploader
	mount_uploader :restaurant_image_code, MealUploader
	belongs_to :customer
	belongs_to :dish
	belongs_to :restaurant 

end
