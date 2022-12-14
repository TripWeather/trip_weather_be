# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LatLongFacade, :vcr do
  it 'takes service response and returns a lat/long object' do
    lat_long_object = LatLongFacade.lat_long_object('1600 Pennsylvania Ave NW, Washington DC, 20500')
    expect(lat_long_object).to be_an(LatLong)
    expect(lat_long_object.latitude).to eq(38.8974)
    expect(lat_long_object.longitude).to eq(-77.0366)
  end

  it 'takes service response and returns a lat/long object, second address' do
    lat_long_object = LatLongFacade.lat_long_object('200 E Colfax Ave, Denver, CO 80203')
    expect(lat_long_object).to be_an(LatLong)
  end
end
