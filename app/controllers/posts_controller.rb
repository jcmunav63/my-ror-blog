class PostsController < ApplicationController
  before_action :set_current_user, only: [:index, :new, :create]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = @current_user.posts.build
  end

  def create
    @post = @current_user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@current_user, @post), notice: 'Post was successfully created!'
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes.create(user: @current_user)

    redirect_to user_post_path(@post.author, @post)
  end

  def unlike
    @post = Post.find(params[:id])
    @post.likes.where(user: @current_user).destroy_all if @post.likes.exists?(user: @current_user)

    redirect_to user_post_path(@post.author, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
