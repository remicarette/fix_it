class MessagesController < ApplicationController

  def create
    @booking = current_user.bookings.last
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to booking_path(@booking)
    else
      @friend   = User.find(params[:user_id])
      @messages = current_user.conversation_with(params[:user_id])
      render :index
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
