class MessagesController < ApplicationController

  def index
    @message = Message.new
    # @rooms = Room.all
  end

  def create
    @messages = Message.create(message_params)

    if @messages.save
      redirect_to room_path(@messages.room.id)
    else
      render :show
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end
