class User < ApplicationRecord

  # Associations
    has_many :comments, foreign_key: :user_id
    has_many :likes, foreign_key: :user_id
    has_many :posts, foreign_key: :author_id
    # dependent: :destroy

  # Attributes
    attribute :name, :string
    attribute :bio, :text
    attribute :photo, :string
    attribute :posts_counter, :integer, default: 0

  # Validations
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Methods

  def three_recent_posts
    
    # 'order' to sort the posts by 'created_at' in descending order
    # 'limit' to limit the result to 3 posts
    self.posts.order(created_at: :desc).limit(3)

  end


end
