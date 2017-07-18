class Recipe < ActiveRecord::Base
	self.table_name = 'recipes'
	belongs_to :burger
	belongs_to :ingredient
end