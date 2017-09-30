class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order_by_last_active_at # and posts that are commented
  end
end
