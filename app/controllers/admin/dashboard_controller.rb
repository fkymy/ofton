class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    @data = KpiManager.fetch_data
  end
end
