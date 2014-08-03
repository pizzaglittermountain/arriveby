class Event < ActiveRecord::Base
  validates :start_location, :end_location, :arrival_time, :departure_time, :presence => true

  def get_travel_time
    start = URI.encode(self.start_location)

    finish = URI.encode(self.end_location)

    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{finish}&key=AIzaSyBxk_rNeQUv47WUNLoaCTyLlevEF9fICdo"

    raw_data = open(url).read

    parsed_data = JSON.parse(raw_data)

    routes = parsed_data["routes"]

    # routes.each do |route|
      return routes.first["legs"][0]["duration"]["value"]
    # end
  end

end
