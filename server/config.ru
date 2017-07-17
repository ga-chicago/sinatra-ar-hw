require 'bundler'
Bundler.require

require './models/PersonModel'
require './models/FloorModel'
require './models/SignupModel'
require './models/AmenityModel'
require './controllers/PersonController'
require './controllers/FloorController'
require './controllers/AmenityController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'apt_building'
)

map ('/people'){run PersonController}
map ('/floors'){run FloorController}
map ('/amenities'){run AmenityController}