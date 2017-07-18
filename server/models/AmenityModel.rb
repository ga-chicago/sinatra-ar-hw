class Amenity < ActiveRecord::Base
	self.table_name = 'amenities'
	has_many :signups
	has_many :people, through: :signups
end