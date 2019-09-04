class Pro::BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user.id).reverse
  end

  def show
    @booking = Booking.where(params[:id])
  end

end
