class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body
end
