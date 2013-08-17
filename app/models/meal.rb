class Meal < ActiveRecord::Base
	mount_uploader :dish_image_code, MealUploader
	mount_uploader :restaurant_image_code, MealUploader
	belongs_to :customer
	belongs_to :dish
	belongs_to :restaurant 	

	def self.populate(params, session_user_name)
		meal = Meal.new(params)
		restaurant_id = params[:restaurant_id]
		
		if session_user_name.blank?
			#store user name from param
		else
			#store user from session
		end
		
		if !params[:restaurant_name].blank?
			restaurant = Restaurant.where("name like ?", "%#{params[:restaurant_name]}%").first
			if restaurant.blank?
				#add restaurant to db
				restaurant = Restaurant.new
				restaurant.name = params[:restaurant_name]
				restaurant.image_code = params[:restaurant_image_code]
				
				if restaurant.save
				 restaurant_id = restaurant.id
				end
			else
				restaurant_id = restaurant.id			
			end			
		end
		
		if !params[:dish_name].blank?
			#save dish
			#puts "\n\n\nparams ==> #{params.inspect}\n\n\n"
			dish = Dish.new
			dish.name = params[:dish_name]
			dish.image_code = params[:dish_image_code] 
			dish.price = params[:price]
			dish.restaurant_id = restaurant_id
			
			dish.save			
		end
		
		meal
	end
end
