class Admin::BulletinsController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    @bulletins = Bulletin.all
  end

  def new
    @bulletin = Bulletin.new
  end

  def create
    @bulletin = Bulletin.new(bulletin_params)

    if @bulletin.save
      ActivityNotification::Notification.notify(:users, @bulletin)

      redirect_to admin_bulletins_path
    else
      render 'new'
    end
  end

  private

  def bulletin_params
    params.require(:bulletin).permit(:user_id, :body)
  end
end
