module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!

      before_action :set_post, only: %i[index create]

      # GET /posts/:post_id/comments
      # http://localhost:3000/api/v1/users/6/posts/16/comments
      def index
        comments = Post.find(params[:post_id]).comments
        render json: comments
      end

      # POST /posts/:post_id/comments
      # http://localhost:3000/api/v1/users/6/posts/16/comments
      def create
        @comment = @post.comments.build(comment_params.merge(user_id: @user.id))
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
