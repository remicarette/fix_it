class ProfilesController < ApplicationController

  def index
    if params[:zip_code].present?
      @results_geo = Geocoder.search(params[:zip_code]).first
      latitude = @results_geo.latitude
      longitude = @results_geo.longitude
      users_zip = User.near([latitude, longitude], 15)
      # users_zip = User.where(zip_code: params[:zip_code])
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
        if @users == []
          redirect_to root_path, alert: "Désolé, pour l'instant il n'y a pas de dépanneurs disponibles dans cette région."
        else
          @users
        end
      end
    else
      redirect_to root_path, alert: "Veuillez indiquer un code postal, s'il vous plaît."
    end
  end

  def show
    @pro = User.find(params[:id])
    @equipements = Equipement.where(user: current_user)
    @booking = Booking.new
  end
end# give all users 10km around "59000"
