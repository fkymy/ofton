class AdminsController < ApplicationController
  layout 'admin'

  before_action :debug
  before_action :authenticate_admin!

  private

  def debug
    debugger
  end
end
