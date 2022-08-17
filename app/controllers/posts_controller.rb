class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post_id = params[:id]
  end
end
