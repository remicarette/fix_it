class ProfilesController < ApplicationController
  def index
    if params[:query].present?
      zip_code = params[:query][:zip_code]
      brand = params[:query][:brand]
      sql_query = "zip_code ILIKE :query OR model ILIKE :query"
      @User = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @user = User.all
    end
  end

  def show
    @pro = User.find(params[:id])
    @equipements = Equipement.where(user: current_user)
    @booking = Booking.new
  end
end
