require 'rails_helper'

RSpec.describe NavService, :vcr do
  it 'should return parsed route hash' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"

    lat_long_starting_hash = LatLongService.address_to_coord(starting_address)
    lat_long_ending_hash = LatLongService.address_to_coord(end_address)

    start_lat = lat_long_starting_hash[:data][0][:latitude]
    start_long = lat_long_starting_hash[:data][0][:longitude]

    start_latlong = "#{start_lat},#{start_long}"

    end_lat = lat_long_ending_hash[:data][0][:latitude]
    end_long = lat_long_ending_hash[:data][0][:latitude]

    end_latlong = "#{end_lat},#{end_long}"
 
    nav_service_call = NavService.nav_info(start_latlong, end_latlong) #lat/long or substituting the spaces for pluses

    expect(nav_service_call).to be_a(Hash)
    expect(nav_service_call[:route][:realTime]).to be_an(Integer)
  end
end