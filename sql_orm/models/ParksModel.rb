class Parks < ActiveRecord::Base

	self.table_name = 'parks'
		has_many :member

		has_many :types, through: :member
end