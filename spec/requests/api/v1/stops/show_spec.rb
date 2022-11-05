# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stops API | Show' do
  describe 'Stop Show' do
    context('Happy Path') do
      let!(:load_obj) do
        @trip = trip_initialize_has_many('1000')
        @stop = @trip.stops.first.id
      end
      it 'stop has correct data types' do
        get api_v1_trip_stop_path('1000', @trip, @stop)
        expect(response).to have_http_status(200)

        stops_response = JSON.parse(response.body, symbolize_names: true)
        show_stop_type_check(stops_response[:data])
      end
    end

    context('Edge Case') do
      let!(:load_obj) { @trip = trip_initialize_has_many('1000') }
      it 'returns 404 if stop not found with :id' do
        id = 0
        get api_v1_trip_stop_path('1000', @trip, id)
        expect(response).to have_http_status(404)

        error_response = JSON.parse(response.body, symbolize_names: true)
        show_not_found_check(error_response, id)
      end
    end
  end
  def show_stop_type_check(stop)
    expect(stop[:id]).to be_an String
    expect(stop[:type]).to eq 'stop'
    expect(stop[:attributes]).to be_an Hash
    expect(stop.dig(:attributes, :type_of_stop)).to be_an String
  end

  def show_not_found_check(error_response, id)
    expect(error_response[:errors][0][:status]).to eq '404'
    expect(error_response[:errors][0][:title]).to eq 'Not Found'
    expect(error_response[:errors][0][:detail]).to eq "Couldn't find Stop with 'id'=#{id}"
  end
end
