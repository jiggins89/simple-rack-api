require 'pry'
require 'json'

module ApplicationHelpers
  def handle_response(message, status = 200)
    response.status = status
    response.write(message)
  end

  def return_objects(objs)
    handle_response(JSON.generate(objs))
  end

  def api_key(user)
    user.values[0][:api_key]
  end
end
