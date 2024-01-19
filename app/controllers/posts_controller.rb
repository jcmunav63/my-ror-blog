class PostsController < ApplicationController
  def user_all_posts
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def single_post
    @post = Post.find(params[:id])
  end
end
