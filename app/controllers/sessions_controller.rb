class SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    user = User.find_by_email(session_params[:email])
    if user.nil? || !user.authenticate(session_params[:password])
      return render json: { error: 'Invalid email or password' }, status: 422
    end
    render json: { data: user.as_json(only: [:name, :email, :token]) }
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
