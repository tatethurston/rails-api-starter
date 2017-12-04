require 'securerandom'

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.new(user_params)
    user.token = SecureRandom.uuid
    user.save!
    render json: { data: user.as_json(only: [:name, :email, :token]) }
  end

  def user_params
    params.permit(:email, :password, :name)
  end
end
