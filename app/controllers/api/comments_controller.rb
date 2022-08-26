class API::CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: %i[create destroy]
  def index
    render json: Post.find(params[:post_id]).comments, status: 200
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        format.html { redirect_to user_post_path(current_user, @post) }
        flash[:success] = 'Comment created successfully'
      else
        format.html { redirect_to user_post_path(current_user, @post) }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
      format.html { redirect_to user_post_path(current_user, @comment.post) }
      flash[:success] = 'Comment deleted successfully'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
