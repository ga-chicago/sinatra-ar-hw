require 'bundler'
Bundler.require

require './models/TeacherModel'
require './controllers/TeacherController'
require './models/StudentModel'
require './controllers/StudentController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'school'
)

map('/teachers'){run TeacherController}
map('/students'){run StudentController}
