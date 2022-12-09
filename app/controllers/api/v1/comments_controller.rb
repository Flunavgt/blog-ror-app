class Api::V1::CommentsController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(post_id: params[:post_id])

    if @comments.empty?
      json_response({ msg: 'No post, comments or user found' }, 400)
    else
      render json: @comments, status: :ok
    end
  end

  def create
    @comment = Comment.new(
      text: comment_params[:text],
      author_id: params[:author_id],
      post_id: params[:post_id]
    )

    json_response(@comment, :created)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
