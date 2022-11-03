require 'rails_helper'

RSpec.describe LatLongFacade, :vcr do
  it 'takes service response and returns a lat/long object' do
    lat_long_object = LatLongFacade.lat_long_object("1600 Pennsylvania Ave NW, Washington DC")

    expect(lat_long_object).to be_an(LatLong)
    expect(lat_long_object.latitude).to eq(38.897675)
    expect(lat_long_object.longitude).to eq(-77.036547)
  end
end