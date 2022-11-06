# frozen_string_literal: true

class LatLongFacade < LatLongService
  def self.lat_long_object(address)
    data = address_to_coord(address)
    lat_long_hash = data[:data][0].slice(:latitude, :longitude)
    lat_long_hash.each do |key, value|
      lat_long_hash[key] = value.round(4)
    end
    LatLong.new(lat_long_hash)
  end
end
