class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = like_params

    if @like.save
      redirect_to user_post_path(current_user, @like.post)
    else
      render :create
    end
  end

  private

  def like_params
    params[:post_id]
  end
end
