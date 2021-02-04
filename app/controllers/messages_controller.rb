class MessagesController < ApplicationController
  def index
    @rooms = Room.all
  end

  def create
    message = Message.create(message_params)
    redirect_to "/rooms/#{message.room.id}"  
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end
