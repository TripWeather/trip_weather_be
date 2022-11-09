# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LatLongService, :vcr do
  it 'should convert address to latitude/longitude' do
    lat_long_service_call = LatLongService.address_to_coord('1600 Pennsylvania Ave NW, Washington DC')
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lat]).to eq(38.8974)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lng]).to eq(-77.03659)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)
  end

  it 'should convert address to latitude/longitude, second address' do
    lat_long_service_call = LatLongService.address_to_coord('200 E Colfax Ave, Denver, CO 80203')
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lat]).to eq(39.74006)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lng]).to eq(-104.98456)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)
  end

  it 'should convert address to latitude/longitude, third address' do
    lat_long_service_call = LatLongService.address_to_coord('2303 Braun Ct, Golden CO 80401')
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lat]).to eq(39.75231)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lat]).to be_a(Float)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lng]).to eq(-105.15001)
    expect(lat_long_service_call[:results].first[:locations].first[:latLng][:lng]).to be_a(Float)
  end
end
