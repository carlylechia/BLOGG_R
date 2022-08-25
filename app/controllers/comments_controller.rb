class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(current_user, @post) }
        flash[:success] = 'Thank you for your comment!'
      else
        flash[:error] = 'Failed to save comment'
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
