# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Addresses API | Show' do
  describe 'Addresses Show' do
    context('Happy Path') do
      let!(:load_obj) do
        @stop = create(:stop)
        @trip = @stop.trip.id
        @address = @stop.address.id
      end
      it 'address has correct data types' do
        get api_v1_trip_stop_address_path('1000', @trip, @stop, @address)
        expect(response).to have_http_status(200)

        stops_response = JSON.parse(response.body, symbolize_names: true)
        show_addresses_type_check(stops_response[:data])
      end
    end

    context('Edge Case') do
      let!(:load_obj) do
        @stop = create(:stop)
        @trip = @stop.trip
      end
      it 'returns 404 if address not found with :id' do
        id = 0
        get api_v1_trip_stop_address_path('1000', @trip, @stop, id)
        expect(response).to have_http_status(404)

        error_response = JSON.parse(response.body, symbolize_names: true)
        show_not_found_check(error_response, id)
      end
    end
  end
  def show_addresses_type_check(stop)
    expect(stop[:id]).to be_an String
    expect(stop[:type]).to eq 'address'
    expect(stop[:attributes]).to be_an Hash
    expect(stop.dig(:attributes, :location)).to be_an String
  end

  def show_not_found_check(error_response, id)
    expect(error_response[:errors][0][:status]).to eq '404'
    expect(error_response[:errors][0][:title]).to eq 'Not Found'
    expect(error_response[:errors][0][:detail]).to eq "Couldn't find Address with 'id'=#{id}"
  end
end
