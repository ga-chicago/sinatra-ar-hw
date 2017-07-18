class Member < ActiveRecord::Base

	self.table_name = 'member'

 	belongs_to :parks
  	belongs_to :types

end
