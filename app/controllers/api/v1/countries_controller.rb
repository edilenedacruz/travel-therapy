class Api::V1::CountriesController < ApplicationController
  def index
    render json: Country.all
  end

  def show
    render json: Country.find(params[:id])
  end

  def create
    render json: Country.create(country_params)
  end

  def update
    render json: Country.update(country_params)
  end

  def destroy
    Country.delete(params[:id])
  end

  private

  def country_params
    params.require(:country).permit(:country_id, :country, :latitude, :longitude, :city)
  end
end
