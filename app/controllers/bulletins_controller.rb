class BulletinsController < ApplicationController

  def show
    @bulletin = Bulletin.find(params[:id])
  end
end
