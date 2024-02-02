class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.find(params[:user_id]) # current_user
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id]) # current_user
    @post = @user.posts.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created!'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    if @post.destroy
      @user.posts_counter -= 1
      @user.save
      redirect_to user_posts_path(@post.author), notice: 'Post was successfully destroyed.'
    else
      redirect_to user_posts_path(current_user), alert: 'Post could not be destroyed.'
    end
  end

  def like
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def unlike
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post.likes.where(user: @user).destroy_all if @post.likes.exists?(user: @user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
