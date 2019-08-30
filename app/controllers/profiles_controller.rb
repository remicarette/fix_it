class ProfilesController < ApplicationController

  def index
    if params[:zip_code].present?
      users_zip = User.all.where(zip_code: params[:zip_code])
      if params[:model].present?
        users_brands = []
        users_zip.each do |user|
          @brands = []
          user.skills.each do |skill|
            @brands << skill.brand
          end
          users_brands << user if @brands.include? params[:model]
        end
        users_brands.nil? ? @users = users_zip.where(user_type: 'pro') : @users = users_brands
      else
        @users = users_zip.where(user_type: 'pro')
      end
    else
      redirect_to root_path, alert: "Please type in a zip code!"
    end
  end

  def show
    @pro = User.find(params[:id])
    @equipements = Equipement.where(user: current_user)
    @booking = Booking.new
  end
end
