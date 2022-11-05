# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stops API | Index' do
  describe 'Stop Index' do
    context('Happy Path') do
      let!(:load_obj) { @trip = trip_initialize_has_many('1000', 2) }
      it 'returns all stops associated to a trip' do
        get api_v1_trip_stops_path('1000', @trip)
        expect(response).to have_http_status(200)

        stops_response = JSON.parse(response.body, symbolize_names: true)
        expect(stops_response[:data].count).to eq 4
      end

      it 'all stops have correct data types' do
        get api_v1_trip_stops_path('1000', @trip)
        expect(response).to have_http_status(200)

        stops_response = JSON.parse(response.body, symbolize_names: true)
        stops_response[:data].each { |stop| index_stop_type_check(stop) }
      end
    end

    context('Sad Path') do
      let!(:load_obj) { @trip = create(:trip) }
      it 'returns empty array if trip has no stops' do
        get api_v1_trip_stops_path('1000', @trip)
        expect(response).to have_http_status(200)

        stops_response = JSON.parse(response.body, symbolize_names: true)
        expect(stops_response).to eq data: []
      end
    end
  end
  def index_stop_type_check(stop)
    expect(stop[:id]).to be_an String
    expect(stop[:type]).to eq 'stop'
    expect(stop[:attributes]).to be_an Hash
    expect(stop.dig(:attributes, :type_of_stop)).to be_an String
  end
end


