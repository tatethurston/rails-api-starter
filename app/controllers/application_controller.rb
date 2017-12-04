class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  attr_reader :current_user

  before_action :authenticate_request

  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActiveRecord::RecordInvalid, with: :record_invalid

  def record_invalid(exception)
    render json: { error: exception.message }, status: 422
  end

  def record_not_found(exception)
    render json: { error: exception.message }, status: 404
  end

  private

  def authenticate_request
    @current_user ||= authenticate_or_request_with_http_token do |token|
      User.find_by_token(token)
    end

    render json: { error: 'Not Authenticated' }, status: 401 if @current_user.nil?
  end
end
