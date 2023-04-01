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

  
    # let's hash data into web token
    # def encode(uid, email)
    #   payload = {
    #     data: {
    #       uid: uid,
    #       email: email,
    #       role: 'admin'
    #     },
    #     exp: Time.now.to_i + (6 * 3600)
    #   }
    #   # JWT.encode(payload, ENV['phase_4_project_backend_key'], 'HS256')
    # end
  
    # unhash the token(decode)
    # def decode(token)
    #   JWT.decode(token, ENV['phase_4_project_backend_key'], true, { algorithm: 'HS256' })
    # end
  
    # verify authorization
    # def verify_auth
    #   auth_headers = request.headers['Authorization']
    #   if !auth_headers
    #     app_response(message: 'failed', status: 401, data: { info: 'Your request is not authorized' })
    #   else
    #     token = auth_headers.split(' ')[1]
    #     save_user_id(token)
    #   end
    # end
  
    # store the user id in sessions
    # def save_user_id(token)
    #   @uid = decode(token)[0]['data']['uid'].to_i
    # end
  
    # remove user from the sessions
    # def remove_user
    #   session.delete(:uid)
    #   session[:expiry] = Time.now
    # end
  
    # check for session expiry
    # def session_expired?
    #   session[:expiry] ||= Time.now
    #   time_diff = session[:expiry] - Time.now
    #   unless time_diff > 0
    #     app_response(message: 'failed', status: 401, data: { info: 'Your session has expired. Please login to continue' })
    #   end
    # end
  
    # get logged in user
    # def user
    #   User.find(@uid)
    # end
  
    # save user
    # def save_user_id(token)
    #   @uid = decode(token)[0]['data']['uid'].to_i
    # end
  
    # get user session
    # def user_session
    #   User.find(session[:uid].to_i)
    # end
  
    # rescue all errors
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


  