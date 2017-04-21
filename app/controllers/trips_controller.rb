class TripsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  def new
    @user = current_user
    @trip = Trip.new
  end

  def create
    @user = current_user
    @trip = @user.trips.create(trip_params)
    if @trip.save
      flash.now[:success] = "Your trip has been created!"
      redirect_to trip_path(@trip)
    else
      flash.now[:error] = @trip.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @city_id = NumbeoService.new.get_city_id(@trip.city)
    @prices = Price.get_prices(@city_id)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @user = current_user
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "Your trip has been updated."
      redirect_to trip_path(@trip)
    else
      flash[:danger] = "Your trip was not updated."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to "/#{@user.slug}"
  end

  private

  def trip_params
    params.require(:trip).permit(:city, :departure_date, :return_date).merge(user_id: current_user.id)
  end
end
