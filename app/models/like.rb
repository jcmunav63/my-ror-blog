class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
  belongs_to :user
  belongs_to :post

  after_create :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
