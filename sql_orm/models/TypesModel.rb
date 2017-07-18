class Types < ActiveRecord::Base

	self.table_name = 'types'

	has_many :member
	has_many :parks, through: :member

end