class Admin::SpotsController < ApplicationController
  before_action :if_not_admin
  before_action :set_spot, only: [:show, :edit, :destroy]



  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
