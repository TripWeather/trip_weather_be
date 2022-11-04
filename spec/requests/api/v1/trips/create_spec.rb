# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Create' do
  describe 'Trip Create' do
    context('Happy Path') do
      it 'creates a new trip' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: Faker::Time.forward(days: 5, period: :morning),
          arrival_date: Faker::Time.forward(days: 10, period: :morning)
        }
        headers = { CONTENT_TYPE: 'application/json' }


        expect do
          post api_v1_trips_path('1000'), headers: headers, params: JSON.generate(trip: trip)
        end.to change(Trip, :count).by(+1)

        expect(response).to have_http_status(201)

        trip_response = JSON.parse(response.body, symbolize_names: true)
        trip_obj_check(trip_response)
      end
    end

    context('Edge Case') do
      it 'returns an error message if missing attributes' do

      end
    end
  end
end

def trip_obj_check(trip)
  expect(trip[:id]).to be_an String
  expect(trip[:type]).to eq 'trip'
  expect(trip[:attributes][:uid]).to eq trip[:uid]
  expect(trip[:attributes][:name]).to eq trip[:name]
  expect(trip[:attributes][:departure_date]).to eq trip[:departure_date]
  expect(trip[:attributes][:arrival_date]).to eq trip[:arrival_date]
end
