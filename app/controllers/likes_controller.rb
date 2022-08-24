class LikesController < ApplicationController
  before_action :authenticate_user!

  def new
    like = Like.new
    respond_to do |format|
      format.html { render :new, locals: { like: } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user_id = current_user.id
    respond_to do |format|
      format.html { redirect_to user_post_path(current_user, @post) }
      flash[:success] = 'Like added!' if @like.save
    end
  end
end
