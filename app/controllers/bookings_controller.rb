class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
  end

end
