class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    comment = Comment.new(text: params[:comment][:text], post:, author: current_user)
    if comment.save
      redirect_to user_post_path(user, post)
    else
      flash.now[:error] = 'Error: comment could not be saved'
      render :new, locals: { comment: }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy
    redirect_to user_post_url(@post.author, @post), notice: 'Comment was successfully destroyed.'
  end
end
