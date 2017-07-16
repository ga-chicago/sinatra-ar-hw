require 'bundler'
Bundler.require

require './models/PersonModel'
require './models/FloorModel'
require './controllers/PersonController'
require './controllers/FloorController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'apt_building'
)

map ('/people'){run PersonController}
map ('/floors'){run FloorController}