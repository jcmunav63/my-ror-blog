module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!

      # Get api/v1/users/:user_id/posts
      #
      # @response_status 200
      # @response_class Array<Post>
      # @response_root posts
      #
      # @param user_id [integer] ID of the user whose posts are requested
      #
      def index
        @user = User.find(params[:user_id])
        @posts = Post.where(author_id: params[:user_id])

        render json: @posts, status: :ok
      end
    end
  end
end
