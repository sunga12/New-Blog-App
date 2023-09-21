class Comment < ApplicationRecord

  # Associations

  belongs_to :user
  belongs_to :post

  # Attributes
  
  attribute :text, :text

  # Callbacks

  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  # Methods

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_post_comments_counter
    post.decrement!(:comments_counter)

  end

end
