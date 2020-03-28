require 'pry'
require 'json'

class UsersApplication
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers['Content-type'] = 'application/json'

    if env['PATH_INFO'] == ''
      if request.post?
        new_user = JSON.parse(request.body.read)
        Database.add_user(new_user)
        response.write('User added successfully.')
      else
        response.write(Database.users.to_s)
      end
    elsif env['PATH_INFO'] =~ %r{\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      response.write(Database.users[id].to_s)
    else
      responses.status = 404
      response.write('Bad times!')
    end

    response.finish
  end
end
