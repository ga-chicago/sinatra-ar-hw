require 'bundler'
Bundler.require

require './models/BookAvailabilityModel'
require './models/LibraryModel'
require './models/BookModel'
require './models/UserModel'

require './controllers/LibraryController'
require './controllers/BookController'
require './controllers/UserController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'libraries'
)

map('/libraries'){run LibraryController}
map('/books'){run BookController}
map('/users'){run UserController}