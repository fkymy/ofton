class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    @today = Time.now.strftime("%F")
    @month_ago = 30.days.ago.strftime("%F")
    @week_ago = 7.days.ago.strftime("%F")
    @users_all = User.all.size
    @users_week = User.where("created_at >= ?", 7.days.ago).size

    @data = KpiManager.curate_data
  end
end
