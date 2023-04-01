class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_fou

    # before_action :session_expired?, only: [:check_login_status]


    def create_session(user)
        session[:user_id] = user.id
    end

    def register
        user = User.create(user_params)
        if user.valid?
          create_session(user)
          app_response(message: 'Registration was successful', status: :created, data: user)
        else
          app_response(message: 'Something went wrong during registration', status: :unprocessable_entity, data: user.errors)
        end
    end
    
    def login
        user = User.create!(user_params)
        if user.valid?
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { errors: users.errors.full_messages }, status: :unprocessable_entity
        end
      end


    def logout
        session.delete(:user_id)
        head :no_content
    end

    def check_login_status
        app_response(message: 'success', status: :ok)
    end

    private 
    
    def user_params
        params.permit(:username, :email, :password)
    end

    def require_login
        unless logged_in?
          app_response(message: 'You must be logged in to access this page', status: :unauthorized)
        end
    end

    def record_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    def not_found
        render json: { error: "User Not Found" }, status: :unauthorized
    end

end