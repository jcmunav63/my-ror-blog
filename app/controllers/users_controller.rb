class UsersController < ApplicationController
  # before_action :set_current_user, only: %i[index show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
    @show_all_posts_button = @user.posts_counter.positive?
  end
end
