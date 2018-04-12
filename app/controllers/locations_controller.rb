class LocationsController < ApplicationController
  def new
    @location = Location.new
    @arr_with_locations = Location.return_array_with_latitude_and_longitude
  end

  def create
    location = Location.new(location_params)

    if location.save
      redirect_to location
      flash[:notice] = 'Marker added!'
    else
      redirect_back(fallback_location: request.referer)
      flash[:alert] = location.errors.full_messages.join(', ')
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end
