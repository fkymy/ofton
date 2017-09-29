class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts # and posts that are commented
  end
end
