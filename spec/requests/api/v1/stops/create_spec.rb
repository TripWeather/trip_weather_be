# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stops API | Create' do
  describe 'Stop Create' do
    context('Happy Path') do
      let!(:load_trip) { @trip = create(:trip) }
      it 'creates a stop and automatically associates it to a trip' do
        stop = {
          type_of_stop: 'start',
          location: Faker::Address.full_address
        }
        headers = { CONTENT_TYPE: 'application/json' }

        expect do
          post api_v1_trip_stops_path('1000', @trip), headers: headers, params: JSON.generate(stop: stop)
        end.to change(Stop, :count).by(+1)

        expect(response).to have_http_status(201)

        stop_response = JSON.parse(response.body, symbolize_names: true)
        create_stop_obj_check(stop_response[:data], stop)
      end
    end

    context('Edge Case') do
      # let!(:load_obj) { @trip = trip_initialize_has_many('1000') }
      # it 'returns 404 if stop not found with :id' do
      #   id = 0
      #   get api_v1_trip_stop_path('1000', @trip, id)
      #   expect(response).to have_http_status(404)
      #
      #   error_response = JSON.parse(response.body, symbolize_names: true)
      #   show_not_found_check(error_response, id)
      # end
    end
  end
  def create_stop_type_check(stop_response, stop)
    expect(stop_response[:id]).to be_an String
    expect(stop_response[:type]).to eq 'stop'
    expect(stop_response[:attributes]).to be_an Hash
    expect(stop_response.dig(:attributes, :type_of_stop)).to eq stop[:type_of_stop]
    expect(stop_response.address).to eq stop[:location]
  end

  def create_unproc_entity_check(error_response, errors)
    expect(error_response[:errors][0][:status]).to eq '422'
    expect(error_response[:errors][0][:title]).to eq 'Unprocessable Entity'
    expect(error_response[:errors][0][:detail]).to eq errors
  end
end
