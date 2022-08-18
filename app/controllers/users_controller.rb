class UsersController < ApplicationController
  def initialize
    super
    @users = User.all
  end

  def index; end

  def show
    @user_id = params[:id]
    @user = @users.find(@user_id)
  end
end
