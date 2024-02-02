class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # User::Roles
  # The available roles
  ROLES = %i[admin default].freeze # Option A

  def admin?
    role == 'admin'
  end

  # enum role: { user: 0, admin: 1 } # Option B

  def is?(requested_role)
    role == requested_role.to_s
  end

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
