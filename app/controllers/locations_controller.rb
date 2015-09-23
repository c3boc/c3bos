class LocationsController < ApplicationController
  before_action :authorize_admin

  def index
    @locations = Location.all
    @location = Location.new
  end

  def create
    @location = Location.new(user_params)

    if @location.save
      redirect_to locations_path, :info => "Location added"
    else
      redirect_to locations_path, :danger => "Location not added"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path, :info => "Location removed"
  end

  private
  def user_params
    params.require(:location).permit(:title, :room)
  end

end
