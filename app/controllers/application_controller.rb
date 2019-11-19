class ApplicationController < ActionController::API
  before_action :authenticate_request
  after_action :verify_authorized, only: [:update, :destroy]
  include Pundit
  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  protected

  def authenticate_request
    @current_user = AuthenticateApiRequest.call(request.headers).result
    not_authorized unless @current_user
  end

  private

  def not_authorized
    render json: { error: 'Not Authorized' }, status: 401
  end
end
