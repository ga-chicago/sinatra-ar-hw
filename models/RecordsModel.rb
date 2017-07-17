class Record < ActiveRecord::Base

	self.table_name = 'albums'

	has_many :doodads, class_name: 'Doodad'
	has_many :track, through: :doodads

end