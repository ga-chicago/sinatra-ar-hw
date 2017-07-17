class Signup < ActiveRecord::Base
	self.table_name = 'signups'
	belongs_to :person
	belongs_to :amenity
end