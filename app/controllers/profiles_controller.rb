class ProfilesController < ApplicationController
  def index
    if params[:query].present?
      raise
      sql_query = "zip_code ILIKE :query OR model ILIKE :query"
      @User = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @user = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
