class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :posts, :comments
end
