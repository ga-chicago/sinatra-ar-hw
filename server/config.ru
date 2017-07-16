require 'bundler'
Bundler.require

require './models/RainModel'
require './controllers/RainController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'weather'
)

map ('/rain'){run RainController}