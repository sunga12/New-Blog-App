class Post < ApplicationRecord

  
  # Associations

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  # Attributes
  
  attribute :title, :string
  attribute :text, :text
  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  # Callbacks

  after_create :increment_user_posts_counter
  after_destroy :decrement_user_posts_counter

  # Methods

  def increment_user_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_user_posts_counter
    author.decrement!(:posts_counter)
  end

  def five_most_recent_comments

    self.comments.order(created_at: :desc).limit(5)
  end

end
