require 'bundler'
Bundler.require

require './models/TeacherModel.rb'
require './controllers/TeacherController.rb'
require './models/StudentModel.rb'
require './controllers/StudentController.rb'
require './models/TutelageModel.rb'
require './models/UserModel.rb'
require './controllers/UserController.rb'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'school'
)

map('/teachers'){run TeacherController}
map('/students'){run StudentController}
map('/users'){run UserController}
