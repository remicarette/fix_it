class Pro::MessagesController < ApplicationController


  def destroy_all
    @booking = Booking.find(params[:id])
    @client = @booking.client
    @messages = Message.where("sender_id = ? AND receiver_id = ?", current_user, @client) + Message.where("sender_id = ? AND receiver_id = ?", @client, current_user)
    @messages.each do |message|
      message.destroy
    end
    redirect_to pro_booking_path(@booking)
  end
end
