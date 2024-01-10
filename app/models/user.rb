class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, dependent: :destroy

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
