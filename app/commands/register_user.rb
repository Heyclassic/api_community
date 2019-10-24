class RegisterUser < AuthenticateUser
  def initialize(email, password, password_confirmation)
    @email = email
    @password = password
    @password_confirmation = password_confirmation
  end

  def call
    super
  end

  private

  attr_accessor :email, :password, :password_confirmation

  def user
    user = User.create(email: email, password: password, password_confirmation: password_confirmation)
    errors.add :user_authentication, user.errors unless user
  end
end
