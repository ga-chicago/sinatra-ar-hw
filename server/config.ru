require 'bundler'
Bundler.require

require './models/PersonModel'
require './models/FloorModel'
require './models/SignupModel'
require './models/AmenityModel'
require './models/UserModel'
require './controllers/PersonController'
require './controllers/FloorController'
require './controllers/AmenityController'
require './controllers/UserController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'apt_building'
)

map ('/people'){run PersonController}
map ('/floors'){run FloorController}
map ('/amenities'){run AmenityController}
map ('/users'){run UserController}