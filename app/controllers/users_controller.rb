class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_fou

    # before_action :session_expired?, only: [:check_login_status]

    # def register
    #     user = User.create(user_params)
    #     user.password = params[:password]
    #     if user.valid?
    #        save_user_id(user.id)
    #       app_response(message: 'Registration was successful', status: :created, data: user)
    #     else
    #       app_response(message: 'Something went wrong during registration', status: :unprocessable_entity, data: user.errors)
    #     end
    # end

    # def register
    #     @user = User.new(user_params)
    #     @user.password = params[:user]
    #     if @user.save
    #       token = encode(@user.id, @user.email)
    #       cookies.signed[:jwt] = { value: token, httponly: true }
    #       app_response(data: { user: UserSerializer.new(@user) })
    #     else
    #       app_response(message: 'failed', status: 422, data: { info: @user.errors.full_messages })
    #     end
    # end


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
 

    # def login
    #     sql = "username = :username OR email = :email"
    #     user = User.where(sql, { username: user_params[:username], email: user_params[:email] }).first
    #     if user&.authenticate(user_params[:password])
    #     #    save_user_id(user.id)
    #     session[:user_id] = user.id
    #        token = encode(user.id, user.email)
    #       app_response(message: 'Login was successful', status: :ok, data: {user: user, token: token})
    #     else
    #       app_response(message: 'Invalid username/email or password', status: :unauthorized)
    #     end
    # end
    
    def login
        user = User.create!(user_params)
        if user.valid?
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { errors: users.errors.full_messages }, status: :unprocessable_entity
        end
      end

#     def login
#         user = User.find_by(email: params[:email])
    
#         if user&.authenticate(params[:password])
#           token = JWT.encode({ user_id: user.id })
#           render json: { token: token }
#         else
#           render json: { error: 'Invalid email or password' }, status: :unauthorized
#         end
#    end

    # def logout
    #     remove_user
    #     app_response(message: 'Logout successful')
    # end

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