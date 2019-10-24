class RegistrationsController < SessionsController
  def create
    command = RegisterUser.call(params[:email], params[:password], params[:password_confirmation]).call
    super
  end
end
