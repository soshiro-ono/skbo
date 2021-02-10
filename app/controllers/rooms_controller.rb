class RoomsController < ApplicationController
  before_action :set_room, only: [:show,:destroy]


  def index
    @rooms = Room.all
    @message = Message.new
    # @room = Room.find(params[:id])
    # @messages = @room.messages.includes(:user)
  end

  def new
    @room = Room.new
  end

  def show
    @rooms = Room.all
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
