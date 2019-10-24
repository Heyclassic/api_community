require 'json_web_token'
class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id, token: user.token) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by(email: email)
    return user if user && user&.authenticate(password)

    errors.add :user_authentication, 'account not signed. Please signup to proceed' unless user
    errors.add :user_authentication, 'invalid password or email' unless user&.authenticate(password)
    nil
  end
end
