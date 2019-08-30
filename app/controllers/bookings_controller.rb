class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
    @user = @booking.pro
    @review = Review.new

    # charger les messages
    conversation = Message.where(sender: current_user, receiver: @user) + Message.where(sender: @user, receiver: current_user)
    @messages = conversation.sort_by { |message| message.created_at }
  end

  def create
    raise
  end


end
