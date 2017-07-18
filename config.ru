require 'bundler'
Bundler.require


require './app'

require "./controllers/AlbumController"
require './controllers/TracksController'
require './controllers/UserController'

require './models/DoodadsModel'
require "./models/RecordsModel"
require "./models/TracksModel"
require './models/UserModel'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'recordcollection'
	)

map('/albums'){run AlbumController}
map('/tracks'){run TracksController}
map('/users'){run UserController}