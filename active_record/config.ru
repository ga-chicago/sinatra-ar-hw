require 'bundler'
Bundler.require

require './models/BurgerModel'
require './models/IngredientModel'
require './models/RecipeModel'
require './models/UserModel'

require './controllers/BurgerController'
require './controllers/IngredientController'
require './controllers/UserController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'american_food'
)

map('/burgers'){run BurgerController}
map('/ingredients'){run IngredientController}
map('/users'){run UserController}