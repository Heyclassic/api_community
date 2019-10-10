class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :avatar_path
end
