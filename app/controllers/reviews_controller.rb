class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:id])
    if @review.save
      redirect_to booking_path(@booking)
    else
      render "bookings/show"
    end
  end

  def review_params
    params.require(:review).permit(:title, :content, :stars)
  end
end
