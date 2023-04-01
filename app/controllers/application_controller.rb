class ApplicationController < ActionController::API
     include ActionController::Cookies
    # before_action :authenticate_request, except: [:register, :login]
  
     rescue_from StandardError, with: :standard_error

    def create 
      user = register
      render json: user
    end
  

    def app_response(message: 'success', status: 200, data: nil)
      render json: {
        message: message,
        data: data
      }, status: status
    end

  
    private

    def authenticate_request
      header = request.headers['Authorization']
      token = header.split(' ').last if header
  
      begin
        decoded = JWT.decode(token, ENV['JWT_SECRET'], true, { algorithm: 'HS256' })
        @current_user_id = decoded.first['user_id']
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    end

    def standard_error(exception)
      app_response(message: 'failed', data: { info: exception.message }, status: 401  )
    end
end


  