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
          departure_date: Faker::Time.forward(days: 5, period: :morning),
          arrival_date: Faker::Time.forward(days: 10, period: :morning)
        }
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_path('1000', @trip), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(200)

        trip_response = JSON.parse(response.body, symbolize_names: true)
        update_trip_obj_check(trip_response[:data][0], trip)
      end
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
