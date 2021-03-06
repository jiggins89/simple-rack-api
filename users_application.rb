class UsersApplication
  include ApplicationHelpers
  attr_reader :request, :response

  def call(env)
    @request = Rack::Request.new(env)
    @response = Rack::Response.new
    response.headers['Content-type'] = 'application/json'

    case request.path_info
    when request.post? && ""
      post_new_user
    when request.get? && ""
      get_all_users
    when %r{/\d+}
      get_user
    else
      handle_response('Nothing here!', 404)
    end

    response.finish
  end

  private

  def post_new_user
    begin
      new_user = JSON.parse(request.body.read)
      if new_user['name'].nil?
        handle_response('User must haver a name!', 400)
      else
        Database.add_user(new_user)
        handle_response('User added successfully.')
      end
    rescue
      handle_response('Invalid JSON request!', 400)
    end
  end

  def get_all_users
    return_objects(authenticated_user)
  end

  def get_user
    id = request.path_info.split('/').last.to_i
    user = Database.users(id)

    if user.empty?
      handle_response('User not found!', 404)
    elsif api_key(user) != api_key(authenticated_user)
      handle_response('Forbidden', 403)
    else
      return_objects(user)
    end
  end

  def authenticated_user
    Database.users(request.env['app.user_id'])
  end

end

