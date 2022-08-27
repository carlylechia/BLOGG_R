class API::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[index show]
  before_action :authenticate_user!, only: %i[new create]

  def index
    render json: @user.posts.includes(comments: [:user])
  end

  def show
    render json: @user.posts.includes(comments: [:user]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
      flash[:success] = 'Post created successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user)
    flash[:success] = 'Post deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
