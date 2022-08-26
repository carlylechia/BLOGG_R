class API::CommentsController < ApplicationController
  # load_and_authorize_resource
  # before_action :authenticate_user!, only: %i[create destroy]
  def index
    render json: Post.find(params[:post_id]).comments
  end
end
