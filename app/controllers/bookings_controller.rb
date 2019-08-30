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
    @booking = Booking.new(booking_params)
    @pro = User.find(params[:user_id])

    @booking.equipement = Equipement.find(params[:booking][:equipement])
    @booking.begin = DateTime.parse(params[:booking][:begin])
    @booking.user = @pro
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render profile_path(@pro)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :status, :error_code)
  end
end
