require 'pry'
require 'json'

module ApplicationHelpers
  def handle_response(message, status = 200)
    response.status = status
    response.write(message)
  end
end
