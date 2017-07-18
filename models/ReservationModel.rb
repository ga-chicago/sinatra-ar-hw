

class Reservation < ActiveRecord::Base
	self.table_name = 'reservation'
	belongs_to :menu 
	belongs_to :restaurant
end