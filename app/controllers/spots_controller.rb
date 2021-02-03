class SpotsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show,:search]
  before_action :set_spot, only: [:edit, :show, :update,:destroy]  


  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.create(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @spot.destroy
      redirect_to root_path
    else
      redirect_to spot_path(@spot.id)
    end
  end


  def edit
  end

  private
  def spot_params
    params.require(:spot).permit(:title, :description,:price).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
