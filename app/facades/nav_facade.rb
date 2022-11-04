class NavFacade < NavService

  # def self.lat_long_object(address)
  #   data = address_to_coord(address)
  #   lat_long_hash = data[:data][0].slice(:latitude, :longitude)
  #   LatLong.new(lat_long_hash)
  # end

  def self.get_directions(start_address, end_address)
    route = route_directions(start_address, end_address)[:route][:legs][0][:maneuvers]

    all_directions = [] #{}
    # step_num = 0
    route.each do |step|
      # all_directions.store(step_num, step[:narrative])
      # step_num += 1
      all_directions << step[:narrative]
    end
    require 'pry'; binding.pry
  end

  def self.get_trip_details(start_address, end_address)
    details = route_directions(start_address, end_address)[:route]
  end
end