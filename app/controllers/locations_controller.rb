class LocationsController < ApplicationController
  def index
    @locations = Location.all

  end

  def new
    @location = Location.new
    @cities = City.all
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_index_path
    end
  end

  private
  def location_params
    params.require(:location).permit(:name, :city_id, :address)
  end
end
