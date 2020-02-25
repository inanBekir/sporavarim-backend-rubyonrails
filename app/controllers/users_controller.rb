class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: %i[login register]

    def login
        authenticate params[:email], params[:password]
      end
      def test
        render json: {
              message: 'You have passed authentication and authorization test'
            }
      end
    # POST /register
  def register
    @user = User.create(user_params)
   if @user.save
    render json: @user, status: 201 
   else
    render json: @user.errors, status: 422
   end 
  end

  private
  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
end

  def user_params
    params.permit(
      :name,
      :surname,
      :username,
      :email,
      :password,
      :user_type,
      :last_login_date
    )
  end
end
