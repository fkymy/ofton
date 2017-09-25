class UsersController < ApplicationController
  
  def show
    @current_user = current_user
    @user = User.first
  end
end
