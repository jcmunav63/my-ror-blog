class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_user_posts_counter

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def liked_by_user?(user)
    likes.exists?(user: user)
  end

  private

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end
end
