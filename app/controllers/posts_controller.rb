class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(comments: [:author]).where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user)
    respond_to do |format|
      format.html do
        if post.save
          redirect_to user_posts_path(current_user.id), notice: 'Posted successfully'
        else
          flash[:notice] = 'Error: Not able to create post'
          render :new, locals: { post: }
        end
      end
    end
  end
end
