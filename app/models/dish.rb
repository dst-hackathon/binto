class Dish < ActiveRecord::Base
	mount_uploader :image_code, DishUploader
	belongs_to :restaurant

	def restaurant_name
		self.restaurant && self.restaurant.name
	end
	
	def populate_restaurant(restaurant_name)
		restaurant_id = nil
		if !restaurant_name.blank?
			exist_restaurant = Restaurant.where("name like ?", "%#{restaurant_name}%").first
			if exist_restaurant.blank?
				#add restaurant to db
				restaurant = Restaurant.new
				restaurant.name = restaurant_name				
				
				if restaurant.save
				 restaurant_id = restaurant.id
				end				
			else
				restaurant_id = exist_restaurant.id			
			end										
		end
		
		restaurant_id
	end
end
