class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :posts
  has_many :comments
end
