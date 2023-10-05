class BandSerializer < ActiveModel::Serializer
  attributes :id

  has_many :posts, :comments
end
