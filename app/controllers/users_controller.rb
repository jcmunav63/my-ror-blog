class UsersController < ApplicationController
  def root_users
    @users = User.all
  end

  def user_page
    @user = User.find(params[:id])
  end
end
