class LikesController < ApplicationController
  # before_action :set_current_user
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)

    if @like.save
      flash[:notice] = 'Like created successfully!'

      redirect_to user_post_path(current_user, @like.post)
    else
      @like.errors.full_messages.to_sentence
    end

    return if @like.save

    flash[:notice] = @like.errors.full_messages.to_sentence
  end

  def destroy
    @like = current_user.likes.find(params[current_user.id])
    post = @like.post
    @like.destroy

    redirect_to user_post_path(current_user, post)
  end

  private

  def like_params
    params.permit(:post_id)
  end

  # def set_current_user
  #   @current_user = User.first
  # end
end
