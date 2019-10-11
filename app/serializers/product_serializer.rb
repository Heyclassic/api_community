class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :images_paths, :comments

  attribute :maker do |object|
    UserSerializer.new(object.user)
  end
end
