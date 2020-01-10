class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :images_paths, :comments

  attribute :maker do |object|
    UserSerializer.new(object.user)
  end

  attribute :tags, &:tag_list

  attribute :votes do |object|
    object.votes_for.size
  end
end
