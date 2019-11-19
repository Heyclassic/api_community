class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  skip_before_action :authenticate_request
  after_action :verify_policy_scoped, only: :index

  def index
    @users = UserPolicy::Scope.new(current_user, User).resolve
    render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: { user: @user, message: "User created" }
    else
      render json: { message: @user.errors }
    end
  end

  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  def update
    authorize @user
    if @user.update(user_params)
      render json: { user: @user, message: "User updated" }
    else
      render json: { message: @user.errors }
    end
  end

  def destroy
    authorize @user
    return unless @user.destroy

    render json: { message: "User deleted" }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :password, :password_confirmation, :name)
  end

  def set_user
    @user ||= User.find(params[:id])
  end
end
