# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
airport_codes = ['SFO', 'JFK', 'LAX', 'ORD']
airport_codes.each do |code|
  Airport.create(code: code)
end

departure_airports = Airport.all
arrival_airports = Airport.all

start_date_range = (2.days.ago..2.days.from_now)

100.times do
  Flight.create(
    departure_airport: departure_airports.sample,
    arrival_airport: arrival_airports.sample,
    start_datetime: rand(start_date_range),
    flight_duration: rand(1..8)
  )
end
