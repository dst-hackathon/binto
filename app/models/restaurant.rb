class Restaurant < ActiveRecord::Base
	mount_uploader :image_code, RestaurantUploader
end
