class ProductSerializer
  include FastJsonapi::ObjectSerializer

  attribute :added do |object|
    object.created_at.strftime("%-d %B %Y")
  end

  attribute :maker do |object|
    UserSerializer.new(object.user)
  end

  attributes :name, :description, :images_paths, :comments

  attribute :tags, &:tag_list

  attribute :votes do |object|
    object.votes_for.size
  end
end
