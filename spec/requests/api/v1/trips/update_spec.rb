# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Update' do
  describe 'Trip Update' do
    let!(:trip) { @trip = create(:trip, uid: '1000') }
    context('Happy Path') do
      it 'updates an existing trip' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: Faker::Date.forward(days: 5),
          arrival_date: Faker::Date.forward(days: 10)
        }
        headers = { CONTENT_TYPE: 'application/json' }
        put api_v1_trip_path('1000', @trip), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(200)

        trip_response = JSON.parse(response.body, symbolize_names: true)
        update_trip_obj_check(trip_response[:data][0], trip)
      end
    end

    context('Edge Case') do
      it 'returns bad request if date is in past' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: Faker::Date.backward(days: 5),
          arrival_date: Faker::Date.forward(days: 10)
        }
        headers = { CONTENT_TYPE: 'application/json' }
        put api_v1_trip_path('1000', @trip), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(400)

        error_response = JSON.parse(response.body, symbolize_names: true)
        update_bad_request_check(error_response)
      end
    end
  end
  def update_trip_obj_check(trip_response, trip)
    expect(trip_response[:id]).to be_an String
    expect(trip_response[:type]).to eq 'trip'
    expect(trip_response[:attributes][:uid]).to eq trip[:uid]
    expect(trip_response[:attributes][:name]).to eq trip[:name]
    expect(trip_response[:attributes][:departure_date]).to be_an String
    expect(trip_response[:attributes][:arrival_date]).to be_an String
  end

  def update_bad_request_check(error_response)
    expect(error_response[:errors][0][:status]).to eq '400'
    expect(error_response[:errors][0][:title]).to eq 'Bad Request'
    expect(error_response[:errors][0][:detail]).to eq 'Date cannot be in the past'
  end
end

