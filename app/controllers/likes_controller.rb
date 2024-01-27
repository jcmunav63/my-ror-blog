class LikesController < ApplicationController
  before_action :set_current_user # , only: [:create]

  def create
    @like = current_user.likes.new(like_params)

    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end

    redirect_to @like.post

    # @post = Post.find(params[:post_id])
    # @like = Like.new(user_id: params[:user_id], post_id: params[:post_id])

    # respond_to do |format|
    #   format.js
    #   if @like.save
    #     format.html { redirect_to @like.post, notice: 'Like was successfully created.' }
    #     format.json { render json: { likes_count: @like.post.likes_counter }, status: :ok }
    #   else
    #     format.html { redirect_to @like.post, alert: 'Error creating like.' }
    #     format.json { render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy

    redirect_to post
    # @post = POst.find(params[:post_id])
    # @post.likes.find_by(user: current_user).destroy
    # # redirect_to user_post_path(@post.author, @post)

    # respond_to do |format|
    #   format.turbo_stream { render turbo_stream: turbo_stream.replace(@post) }
    #   format.html { redirect_to user_post_path(@post.author, @post) }
    #   format.js
    # end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
  # def find_post
  #   @post = Post.find(params[:post_id])
  # end

  def set_current_user
    @current_user = current_user
  end
end
