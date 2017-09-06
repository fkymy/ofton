class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    @today = Time.now.strftime("%F")
    @month_ago = 30.days.ago.strftime("%F")
    @week_ago = 7.days.ago.strftime("%F")
    @data = KpiManager.fetch_data
  end
end
