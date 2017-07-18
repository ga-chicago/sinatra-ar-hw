class Doodad < ActiveRecord::Base

	self.table_name = 'doodads'
	belongs_to :record
	belongs_to :track

end