class ProfilesController < ApplicationController
  def index
    if params[:zip_code].present?
      @geo = Geocoder.search(params[:zip_code]).first
      users = User.near([@geo.latitude, @geo.longitude], 15).where(user_type: 'pro')
      if users == []
        redirect_to root_path, alert: "Désolé, pour l'instant il n'y a pas de dépanneurs disponibles dans cette région."
      else
        @users = brand_method(users)
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

  private

  def brand_method(users)
    if params[:model].present?
      users_brands = []
      users.map do |user|
        brands = []
        user.skills.each do |skill|
          brands << skill.brand
        end
        users_brands << user if brands.include? params[:model]
      end
      if users_brands == []
        redirect_to root_path, alert: "Désolé, pour l'instant il n'y a pas de dépanneurs disponibles qui conaissent la marque indiquée."
      else
        sort_users = users_brands
      end
    else
      sort_users = users
    end
    return sort_users
  end
end
