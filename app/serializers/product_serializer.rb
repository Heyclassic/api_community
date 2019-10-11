class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :images_paths, :comments

  attribute :maker do |object|
    UserSerializer.new(object.user)
  end

  attribute :tags do |object|
    object.tag_list
  end
end
