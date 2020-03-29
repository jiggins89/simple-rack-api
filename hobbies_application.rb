require_relative 'application_helpers.rb'

class HobbiesApplication
  include ApplicationHelpers
  attr_reader :request, :response

  def call(env)
    @request = Rack::Request.new(env)
    @response = Rack::Response.new
    response.headers['Content-type'] = 'application/json'

    case request.path_info
    when request.get? && ""
      get_all_hobbies
    when %r{/\d+}
      get_hobby
    else
      handle_response('Nothing here!', 404)
    end

    response.finish
  end

  private

  def get_all_hobbies
    response.write(JSON.generate(Database.hobbies))
  end

  def get_hobby
    id = request.path_info.split('/').last.to_i
    hobby = Database.hobbies[id]
    if hobby.nil?
      handle_response('User not found!', 404)
    else
      handle_response(JSON.generate(hobby))
    end
  end
end
