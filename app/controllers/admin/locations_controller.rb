class Admin::LocationsController < ApplicationController

  def index
    @locations = Location.all.page(params[:page]).per(8)
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to admin_locations_path
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(location_params)
      redirect_to admin_locations_path
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to admin_locations_path
  end

  private

  def location_params
      params.require(:location).permit(:street_address, :street_address2, :city, :state, :zip, employees_attributes: [:name, :badge_number, :id, :_destroy])
  end

end
