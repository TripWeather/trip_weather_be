# frozen_string_literal: true

class LatLongFacade < LatLongService
  def self.lat_long_object(address)
    data = address_to_coord(address)
    lat_long_hash = data[:data][0].slice(:latitude, :longitude)
    LatLong.new(lat_long_hash)
  end
end
