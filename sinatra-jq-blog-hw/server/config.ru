require 'bundler'
Bundler.require

require './models/PostModel'
require './controllers/PostController'
require './models/CommentModel'
require './controllers/CommentController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'blog'
)

map('/posts'){run PostController}
map('/comments'){run CommentController}
