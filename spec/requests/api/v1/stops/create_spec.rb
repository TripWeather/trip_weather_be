# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stops API | Create' do
  describe 'Stop Create' do
    let!(:load_trip) { @trip = create(:trip) }
    context('Happy Path') do
      it 'creates a stop and automatically associates it to a trip' do
        stop = {
          type_of_stop: 0,
          location: Faker::Address.full_address
        }
        headers = { CONTENT_TYPE: 'application/json' }

        expect do
          post api_v1_trip_stops_path('1000', @trip), headers: headers, params: JSON.generate(stop: stop)
        end.to change(Stop, :count).by(+1)

        expect(response).to have_http_status(201)

        stop_response = JSON.parse(response.body, symbolize_names: true)
        create_stop_obj_check(stop_response[:data])
      end
    end
    describe 'edge casing' do
      context('Edge Case') do
        it 'returns an error message if missing :type_of_stop' do
          stop = {
            location: Faker::Address.full_address
          }
          headers = { CONTENT_TYPE: 'application/json' }

          expect do
            post api_v1_trip_stops_path('1000', @trip), headers: headers, params: JSON.generate(stop: stop)
          end.to change(Stop, :count).by(0)

          expect(response).to have_http_status(422)

          error_response = JSON.parse(response.body, symbolize_names: true)
          create_unproc_entity_check(error_response, ["Type of stop can't be blank"])
        end

        it 'returns an error message if missing :location' do
          stop = {
            type_of_stop: 2
          }
          headers = { CONTENT_TYPE: 'application/json' }

          expect do
            post api_v1_trip_stops_path('1000', @trip), headers: headers, params: JSON.generate(stop: stop)
          end.to change(Stop, :count).by(0)

          expect(response).to have_http_status(422)

          error_response = JSON.parse(response.body, symbolize_names: true)
          create_unproc_entity_check(error_response, ["Location can't be blank"])
        end
      end
    end
  end
  def create_stop_obj_check(stop_response)
    expect(stop_response[:id]).to be_an String
    expect(stop_response[:type]).to eq 'stop'
    expect(stop_response[:attributes]).to be_an Hash
    expect(stop_response.dig(:attributes, :type_of_stop)).to eq 'start'
  end

  def create_unproc_entity_check(error_response, errors)
    expect(error_response[:errors][0][:status]).to eq '422'
    expect(error_response[:errors][0][:title]).to eq 'Unprocessable Entity'
    expect(error_response[:errors][0][:detail]).to eq errors
  end
end
