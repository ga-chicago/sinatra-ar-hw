require './app'
require './models/ParksModel'
require './models/TypesModel'
require './controllers/ParksController'
require './controllers/TypeController'


run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chicago4'
)

map('/parks'){run ParksController}
map('/types'){run TypeController}