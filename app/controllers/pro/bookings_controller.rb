class Pro::BookingsController < ApplicationController

  def index
    if current_user.user_type == "pro"
      @bookings = Booking.where(user_id: current_user.id).where.not(status: 4).order(begin: :desc)
    else
      redirect_to root_path
    end
  end

  def show
    if current_user.user_type == "pro"
      @booking = Booking.find(params[:id])
      @user = @booking.client

      conversation = Message.where(sender: current_user, receiver: @user) + Message.where(sender: current_user, receiver: @user)
      @messages = conversation.sort_by { |message| message.created_at }
      @message = Message.new
    else
      redirect_to root_path
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status += 1
    redirect_to pro_booking_path(@booking) if @booking.save
  end

  def reset
    @booking = Booking.find(params[:id])
    @booking.status = 0
    redirect_to pro_booking_path(@booking) if @booking.save
  end

end
