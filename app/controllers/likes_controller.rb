class LikesController < ApplicationController
  before_action :set_current_user # , only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user)
    # redirect_to user_post_path(@post.author, @post)

    respond_to do |format|
      # format.turbo_stream { render turbo_stream: turbo_stream.replace(@post) }
      # format.html { redirect_to user_post_path(@post.author, @post) }
      format.js
    end
  end

  def destroy
    @post = POst.find(params[:post_id])
    @post.likes.find_by(user: current_user).destroy
    # redirect_to user_post_path(@post.author, @post)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@post) }
      format.html { redirect_to user_post_path(@post.author, @post) }
      format.js
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def set_current_user
    @current_user = current_user
  end
end
