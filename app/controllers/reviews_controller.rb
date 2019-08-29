class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    raise
    if @review.save
      redirect_to
  end

  def review_params
    params.require(:review).permit(:title, :content, :stars)
  end
end
