# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Index' do
  describe 'Trip Index' do
    let!(:load_obj) { 3.times { |i| trip_initialize_has_many('1000', i) } }
    context('Happy Path') do
      it 'returns all trips associated to :uid' do
        get api_v1_trips_path('1000')
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        expect(trips_response[:data].count).to eq 3
      end

      it 'all :uid associated trip values are correct types' do
        get api_v1_trips_path('1000')
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        trips_response[:data].each { |trip| trip_type_check(trip) }
      end
    end

    context('Sad Path') do
      it 'returns empty array if :uid has no trips' do
        get api_v1_trips_path('2000')
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        expect(trips_response).to eq data: []
      end
    end
  end
end

def trip_type_check(trip)
  expect(trip[:id]).to be_an String
  expect(trip[:type]).to eq 'trip'
  expect(trip[:attributes][:uid]).to be_an String
  expect(trip[:attributes][:name]).to be_an String
  expect(trip[:attributes][:departure_date]).to be_an String
end

