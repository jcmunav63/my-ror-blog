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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
