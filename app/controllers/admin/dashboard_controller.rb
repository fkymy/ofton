class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin_admin!

  def index
  end
end
