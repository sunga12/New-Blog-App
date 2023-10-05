class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  # Associations
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  # dependent: :destroy

  # Attributes
  attribute :name, :string
  attribute :role, :string
  attribute :bio, :text
  attribute :photo, :string
  attribute :posts_counter, :integer, default: 0

  # Validations
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }


    # User::Roles
  # The available roles
  Roles = [ :admin , :default ]

  # Methods

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def three_most_recent_posts
    # 'order' to sort the posts by 'created_at' in descending order
    # 'limit' to limit the result to 3 posts
    posts.order(created_at: :desc).limit(3)
  end
end
