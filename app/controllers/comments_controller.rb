class CommentsController < ApplicationController
  before_action :authenticate_user!

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

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @post.comments_counter -= 1
      @post.save
      redirect_to user_post_path(@post.author_id, @post), notice: 'Post was successfully destroyed.'
    else
      redirect_to(@comment.post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
