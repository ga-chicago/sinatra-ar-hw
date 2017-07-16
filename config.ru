require 'bundler'
Bundler.require
require "./models/RecordsModel"
require './app'
require './models/TracksModel'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'recordcollection'
	)