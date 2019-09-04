class MessagesController < ApplicationController

  def create

    @booking = Booking.find(params[:booking])

    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save

      # ACTION CABLE

      ActionCable.server.broadcast("booking_channel_#{@booking.id}", {
        message: @message.to_json })

      # CONVERSATION

      @messages = @message.conversation
      # conversation = Message.where(sender: current_user, receiver: @message.receiver) + Message.where(sender: @message.receiver, receiver: current_user)
      # @messages = conversation.sort_by { |message| message.created_at }

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
