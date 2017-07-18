require './app'
require './models/ParksModel'
require './models/TypesModel'
require './models/MembersModel'
require './models/UsersModel'
require './controllers/ParksController'
require './controllers/TypeController'
require './controllers/UsersController'


run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chicago4'
)

map('/parks'){run ParksController}
map('/types'){run TypeController}
map('/users'){run UsersController}