class MessagesController < ApplicationController

  def create
    @booking = current_user.bookings.last
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])

    if @message.save
      @messages = Message.all
      respond_to do |format|
        format.html { redirect_to booking_path(@booking) }
        format.js
      end
    else
      @friend   = User.find(params[:user_id])
      @messages = current_user.conversation_with(params[:user_id])
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js
      end

    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
