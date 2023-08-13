class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count].to_i
    @booking = Booking.new
    @passenger_count.times { @booking.passengers.build }
  end
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end
  def show
    @booking = Booking.find(params[:id])
  end
  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
