# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stops API | Create' do
  describe 'Stop Create' do
    let!(:load_trip) do
      @trip = trip_initialize_has_many('1000')
      @stop = @trip.stops.first
    end
    context('Happy Path') do
      it 'updates an existing stop' do
        stop = {
          type_of_stop: 1
        }
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_stop_path('1000', @trip, @stop), headers: headers, params: JSON.generate(stop: stop)

        expect(response).to have_http_status(200)

        stop_response = JSON.parse(response.body, symbolize_names: true)
        update_stop_obj_check(stop_response[:data])
      end
    end

    context('Edge Case') do
      it 'returns Unprocessable Entity if :type_of_stop is omitted' do
        stop = {
          location: Faker::Address.full_address
        }
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_stop_path('1000', @trip, @stop), headers: headers, params: JSON.generate(stop: stop)

        expect(response).to have_http_status(422)

        error_response = JSON.parse(response.body, symbolize_names: true)
        update_unproc_entity_check(error_response, [''])
      end
    end
  end
  def update_stop_obj_check(response)
    expect(stop_response[:id]).to be_an String
    expect(stop_response[:type]).to eq 'stop'
    expect(stop_response[:attributes]).to be_an Hash
    expect(stop_response.dig(:attributes, :type_of_stop)).to eq 'extra'
  end

  def create_unproc_entity_check(error_response, errors)
    expect(error_response[:errors][0][:status]).to eq '422'
    expect(error_response[:errors][0][:title]).to eq 'Unprocessable Entity'
    expect(error_response[:errors][0][:detail]).to eq errors
  end
end
