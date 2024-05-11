# app/middleware/authenticate_api.rb
class AuthenticateApi
    def initialize(app)
      @app = app
    end
  
    def call(env)
      request = Rack::Request.new(env)
      
      # Check if the request path is an API endpoint
      if request.path.start_with?('/api')
        # Allow access to login and signup endpoints without authentication
        if request.path =~ %r{\A/api/(login|register)\z}
          return @app.call(env)
        end
        
        # Check if the user is logged in
        if request.session['user_id'].nil?
          return [401, { 'Content-Type' => 'application/json' }, [{ error: 'Unauthorized' }.to_json]]
        end
      end
      
      @app.call(env)
    end
  end
  