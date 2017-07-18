class Burger < ActiveRecord::Base
	self.table_name = 'burgers'
	has_many :recipes, class_name: 'Recipe'
	has_many :ingredients, through: :recipes
end