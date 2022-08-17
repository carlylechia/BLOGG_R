class CommentsController < ApplicationController
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
