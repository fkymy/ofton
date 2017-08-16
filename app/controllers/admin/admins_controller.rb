class Admin::AdminsController < ApplicationController
  layout 'admin'

  def index
    @admins = Admin.all
  end
end
