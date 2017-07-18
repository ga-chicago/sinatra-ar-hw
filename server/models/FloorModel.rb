class Floor < ActiveRecord::Base
	self.table_name = 'floors'
	has_many :people
end