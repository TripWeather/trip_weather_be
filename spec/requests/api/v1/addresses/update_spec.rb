# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Addresses API | Update' do
  describe 'Addresses Update' do
    let!(:load_obj) do
      @trip = trip_initialize_has_many('1000')
      @stop = @trip.stops.first
      @address = @stop.address
    end
    context('Happy Path') do
      it 'updates an existing address' do
        address = {
          location: Faker::Address.full_address
        }
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_stop_address_path('1000', @trip, @stop, @address), headers: headers,
                                                                           params: JSON.generate(address: address)

        expect(response).to have_http_status(200)

        address_response = JSON.parse(response.body, symbolize_names: true)
        update_addresses_obj_check(address_response[:data], address)
      end
    end

    context('Edge Case') do
      it 'returns Unprocessable Entity if location is omitted' do
        address = {}
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_stop_address_path('1000', @trip, @stop, @address), headers: headers,
                                                                           params: JSON.generate(address: address)

        expect(response).to have_http_status(400)

        error_response = JSON.parse(response.body, symbolize_names: true)
        update_unproc_entity_check(error_response, 'param is missing or the value is empty: address')
      end
    end
  end
  def update_addresses_obj_check(stop_response, stop)
    expect(stop_response[:id]).to be_an String
    expect(stop_response[:type]).to eq 'address'
    expect(stop_response[:attributes]).to be_an Hash
    expect(stop_response.dig(:attributes, :location)).to eq stop[:location]
  end

  def update_unproc_entity_check(error_response, error)
    expect(error_response[:errors][0][:status]).to eq '400'
    expect(error_response[:errors][0][:title]).to eq 'Bad Request'
    expect(error_response[:errors][0][:detail]).to eq error
  end
end
