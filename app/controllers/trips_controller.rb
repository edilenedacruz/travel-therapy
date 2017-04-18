class TripsController < ApplicationController
  def new
    @user = current_user
    @trip = Trip.new
  end

  def create
    @user = current_user
    @trip = @user.trips.create(trip_params)
    if @trip.save
      flash[:success] = "Your trip has been created!"
      redirect_to trip_path(@trip)
    else
      flash[:error] = @trip.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
    # @prices = Price.get_prices(@trip.city)
  end

  private

  def trip_params
    params.require(:trip).permit(:city, :departure_date, :return_date)
  end
end
