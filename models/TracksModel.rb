class Track < ActiveRecord::Base

	self.table_name = 'tracks'

	has_many :doodads, class_name: 'Doodad'
	has_many :record, through: :doodads

end