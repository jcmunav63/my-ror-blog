class PostsController < ApplicationController
  before_action :set_current_user

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments).paginate(page: params[:page], per_page: 3)
  end

  def show
    @post = Post.find(params[:id])
  end

    # @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  def new
    @user = User.find(params[:user_id])
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
  end

  def unlike
    @post = Post.find(params[:id])
    @post.likes.where(user: @current_user).destroy_all if @post.likes.exists?(user: @current_user)

    redirect_to user_post_path(@post.author, @post)
  end

  private

  def set_current_user
    @current_user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
