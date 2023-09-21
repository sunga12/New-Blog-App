class Like < ApplicationRecord
  # Associations

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  # Callbacks

  after_create :increment_post_likes_counter
  after_destroy :decrement_post_likes_counter

  # Methods

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end

  def decrement_post_likes_counter
    post.decrement!(:likes_counter)
  end
end
