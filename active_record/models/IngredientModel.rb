class Ingredient < ActiveRecord::Base
	self.table_name = 'ingredients'
	has_many :recipes, class_name: 'Recipe'
	has_many :burgers, through: :recipes
end