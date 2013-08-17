class Dish < ActiveRecord::Base
	mount_uploader :image_code, DishUploader
	belongs_to :restaurant

	def restaurant_name
		self.restaurant && self.restaurant.name
	end
end
