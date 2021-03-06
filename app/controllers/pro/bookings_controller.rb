class Pro::BookingsController < ApplicationController

  def index
    if current_user.user_type == "pro"
      @bookings = Booking.where(user_id: current_user.id).where.not(status: 4).order(created_at: :desc)
    else
      redirect_to root_path
    end
  end

  def show
    if current_user.user_type == "pro"
      @booking = Booking.find(params[:id])
      @user = @booking.client

      conversation = Message.where(sender: current_user, receiver: @user) + Message.where(sender: @user, receiver: current_user)
      @messages = conversation.sort_by { |message| message.created_at }
      @message = Message.new
    else
      redirect_to root_path
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status += 1
    if @booking.save
      ActionCable.server.broadcast("progress_channel_#{@booking.id}", {
        booking: @booking.to_json })
      redirect_to pro_booking_path(@booking) if @booking.save
    end
  end

  def reset
    @booking = Booking.find(params[:id])
    @booking.status = 0
    if @booking.save
      ActionCable.server.broadcast("progress_channel_#{@booking.id}", {
        booking: @booking.to_json })
      redirect_to pro_booking_path(@booking)
    end
  end

end
