class Dish < ActiveRecord::Base
	mount_uploader :image_code, DishUploader
end
