class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_create :update_post_comments_counter

  # after_destroy :decrease_post_comments_counter

  private

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  # def decrease_post_comments_counter
  #   # self.decrement!(:comments_counter, 1)
  #   # post.decrement!(:comments_counter, 1)
  # end
end
