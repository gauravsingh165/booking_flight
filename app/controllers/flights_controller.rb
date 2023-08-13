class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:departure_airport, :arrival_airport)

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    if params[:flight_date].present?
      flight_date = DateTime.new(params[:flight_date]["year"].to_i, params[:flight_date]["month"].to_i, params[:flight_date]["day"].to_i)
      @flights = @flights.where(start_datetime: flight_date.beginning_of_day..flight_date.end_of_day)
    end

    @passenger_count = params[:passenger_count].to_i
  end
end
