require 'pry'
require 'json'


class BaseApplication
  def call
    response = Rack::Response.new
    request = Rack::Request.new(env)
  end
end
