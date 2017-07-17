require 'bundler'
Bundler.require

require "./models/RecordsModel"
require './app'
require "./models/TracksModel"
require "./controllers/AlbumController"
require './controllers/TracksController'
require './models/DoodadsModel'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'recordcollection'
	)

map('/albums'){run AlbumController}
map('/tracks'){run TracksController}
