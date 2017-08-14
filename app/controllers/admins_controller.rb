class AdminsController < ApplicationController

  before_action :debug
  before_action :authenticate_admin!

  private

  def debug
    debugger
  end
end
