require 'rails_helper'

RSpec.describe LatLongService, :vcr do
  it 'should convert address to latitude/longitude' do
    
    lat_long_service_call = LatLongService.address_to_coord("1600 Pennsylvania Ave NW, Washington DC")
    expect(lat_long_service_call[:data][0][:latitude]).to eq(38.897675)
    expect(lat_long_service_call[:data][0][:latitude]).to be_an(Float)

    expect(lat_long_service_call[:data][0][:longitude]).to eq(-77.036547)
    expect(lat_long_service_call[:data][0][:longitude]).to be_an(Float)
  end
end
