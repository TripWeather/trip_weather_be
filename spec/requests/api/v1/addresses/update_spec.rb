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
        update_address_obj_check(address_response[:data], address)
      end
    end

    context('Edge Case') do
      it 'returns Unprocessable Entity if location is omitted' do
        address = {}
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_stop_address_path('1000', @trip, @stop, @address), headers: headers,
                                                                           params: JSON.generate(address: address)

        expect(response).to have_http_status(422)

        error_response = JSON.parse(response.body, symbolize_names: true)
        update_unproc_entity_check(error_response, ["Arrival date can't be in the past"])
      end
    end
  end
  def update_addresses_type_check(stop)
    expect(stop[:id]).to be_an String
    expect(stop[:type]).to eq 'address'
    expect(stop[:attributes]).to be_an Hash
    expect(stop.dig(:attributes, :location)).to eq stop[:location]
  end

  def update_unproc_entity_check(error_response, errors)
    expect(error_response[:errors][0][:status]).to eq '422'
    expect(error_response[:errors][0][:title]).to eq 'Unprocessable Entity'
    expect(error_response[:errors][0][:detail]).to eq errors
  end
end
