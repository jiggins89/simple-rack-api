require 'pry'
require 'json'

class HobbiesApplication
  def call(env)
    response = Rack::Response.new
    response.headers['Content-type'] = 'application/json'

    if env['PATH_INFO'] == ''
      response.write(JSON.generate(Database.hobbies))
    elsif env['PATH_INFO'] =~ %r{\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      response.write(JSON.generate(Database.hobbies[id]))
    else
      response.status = 404
      response.write("No hobbies y'all")
    end

    response.finish
  end
end
