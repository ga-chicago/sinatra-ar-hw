class Person < ActiveRecord::Base
	self.table_name = 'people'
	belongs_to :floor
	has_many :signups
	has_many :amenities, through: :signups
end