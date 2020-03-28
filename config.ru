require_relative 'database.rb'
require_relative 'users_application.rb'
require_relative 'hobbies_application.rb'

map('/users') do
  run UsersApplication.new
end

map('/hobbies') do
  run HobbiesApplication.new
end
