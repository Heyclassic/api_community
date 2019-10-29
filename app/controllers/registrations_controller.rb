class RegistrationsController < SessionsController
  def create
    command = RegisterUser.call(params[:email], params[:password], params[:password_confirmation])
    if command.success?
      render json: { auth_token: command.result, message: "Account created" }
    else
      super
    end
  end
end
