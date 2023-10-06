class PostsSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
end
