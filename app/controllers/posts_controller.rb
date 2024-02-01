class PostsController < ApplicationController
  before_action :authenticate_user!

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

  def like
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def unlike
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post.likes.where(user: @user).destroy_all if @post.likes.exists?(user: @user)

    redirect_to user_post_path(@post.author, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
