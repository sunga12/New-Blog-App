class CommentSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :author
  belongs_to :post
end
