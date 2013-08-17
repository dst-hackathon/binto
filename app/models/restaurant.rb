class Restaurant < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }, :allow_blank => true

	mount_uploader :image_code, RestaurantUploader
end
