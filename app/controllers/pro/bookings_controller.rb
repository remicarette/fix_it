class Pro::BookingsController < ApplicationController

  def index
    if current_user.user_type == "pro"
      @bookings = Booking.where(user_id: current_user.id).reverse
    else
      redirect_to root_path
    end
  end

  def show
    if current_user.user_type == "pro"
      @booking = Booking.where(params[:id])
    else
      redirect_to root_path
    end
  end
end
