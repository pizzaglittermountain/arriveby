require 'open-uri'

class Event < ActiveRecord::Base
  validates :start_location, :end_location, :arrival_time, :phone_number, :presence => true

  before_save :get_travel_time

  def get_travel_time
    start = URI.encode(self.start_location)

    finish = URI.encode(self.end_location)

    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{finish}&key=AIzaSyBxk_rNeQUv47WUNLoaCTyLlevEF9fICdo"

    raw_data = open(url).read

    parsed_data = JSON.parse(raw_data)

    routes = parsed_data["routes"]

    # routes.each do |route|
    self.duration = routes.first["legs"][0]["duration"]["value"]
    # end
  end

  def departure_time
    return self.arrival_time - self.duration
  end

end
