class CommentsController < ApplicationController
  # before_action :set_current_user

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(author: @user))

    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment was successfully created!'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
