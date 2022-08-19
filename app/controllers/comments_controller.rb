class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(current_user, @post) }
        flash[:success] = 'Comment created successfully'
      else
        flash[:error] = 'Failed to save comment'
        format.html { redirect_to user_post_path(current_user, @post) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
