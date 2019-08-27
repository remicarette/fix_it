class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
    @user = @booking.pro
  end

end
