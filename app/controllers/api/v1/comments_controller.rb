module Api
    module V1
      class CommentsController < ApplicationController
        skip_before_action :verify_authenticity_token
        skip_before_action :authenticate_user!
  
        rescue_from ActiveRecord::RecordNotFound, with: :not_found
        rescue_from ActionController::ParameterMissing do |exception|
          render json: { error: exception.message }, status: :bad_request
        end
  
        # Get api/v1/users/:user_id/posts/:post_id/comments
        def index
          comments = Post.find(params[:post_id]).comments
  
          render json: comments, status: :ok
        end
  
        # Post api/v1/users/:user_id/posts/:post_id/comments
        def create
          user_id = params[:user_id]
          user = User.find(user_id)
          post_id = params[:post_id]
          post = Post.find(post_id)
          comment = Comment.new(comment_params)
          comment.user = user
          comment.post = post
  
          if comment.save
            render json: { message: 'Comment has been successfully saved.' }, status: :created
          else
            render json: { message: 'Comment has been has not been saved due to some errors.', errors: comment.errors },
                   status: :bad_request
          end
        end
  
        private
  
        def comment_params
          puts params
          params.permit(:text)
        end
  
        def not_found
          render json: { err: 'Error: Record not found ' }, status: :not_found
        end
      end
    end
  end