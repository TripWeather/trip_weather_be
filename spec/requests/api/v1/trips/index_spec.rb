# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Index' do
  describe 'Trip Index' do
    let!(:load_obj) do
      trip_initialize_has_many('1000', 3)
      trip_initialize_has_many('1000', 2)
      trip_initialize_has_many('1000')
    end
    context('Happy Path') do
      it 'returns all trips' do
        get api_v1_trips_path('1000')
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        expect(trips_response[:data].count).to eq 3
      end

      it 'all trip values are correct types' do
        get api_v1_trips_path('1000')
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        trips_response[:data].each { |trip| trip_type_check(trip) }
      end
    end

    context('Sad Path') do
      it 'returns empty array if user has no trips' do
        get api_v1_trips_path('1000')
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        expect(trips_response).to eq data: []
      end
    end

    context('Edge Case') do
      it 'returns an error if user params do not exist' do
        get api_v1_trips_path('1000')
        expect(response).to have_http_status(404)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        expect(trips_response).to eq 'test'
      end
    end
  end
end

def trip_type_check(trip)
  expect(trip[:uid]).to be_an String
  expect(trip[:name]).to be_an String
  expect(trip[:departure_date]).to be_an DateTime
end

