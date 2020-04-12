require 'pry'

require_relative 'api_key'
require_relative 'application_helpers.rb'
require_relative 'database.rb'
require_relative 'users_application.rb'
require_relative 'hobbies_application.rb'

use ApiKey

map('/users') do
  run UsersApplication.new
end

map('/hobbies') do
  run HobbiesApplication.new
end
