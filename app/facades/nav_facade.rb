# frozen_string_literal: true

class NavFacade < NavService
  def self.get_directions(start_address, end_address)
    route = route_directions(start_address, end_address)[:route][:legs][0][:maneuvers]
    all_directions = []
    turn_distances = []
    lat_lng_per_step = []

    route.each do |step|
      all_directions << step[:narrative]
      turn_distances << step[:distance]
      lat_lng_per_step << step[:startPoint]
    end
    all_directions.zip(turn_distances, lat_lng_per_step)
  end

  def self.trip_details(start_address, end_address)
    details = route_directions(start_address, end_address)[:route].slice(:realTime, :hasTollRoad, :distance)
  end

  def self.nav_object(start_address, end_address)

    return_hash = {}
    return_hash[:directions] = get_directions(start_address, end_address)
    return_hash[:details] = trip_details(start_address, end_address)
    object = Nav.new(return_hash)
  end
end
