class ApiKey
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    api_key = env['HTTP_API_KEY']
    user = Database.find_user_by_api_key(api_key)

    if user.nil?
      [403, {}, ['Forbidden']]
    else
      env['app.user_id'] = user[:id]
      @app.call(env)
    end
  end
end
