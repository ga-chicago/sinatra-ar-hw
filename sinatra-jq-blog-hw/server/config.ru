require 'bundler'
Bundler.require

require './models/BookModel'
require './controllers/BookController'
require './models/CdModel'
require './controllers/CdController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'library'
)

map('/books'){run BookController}
map('/cds'){run CdController}
