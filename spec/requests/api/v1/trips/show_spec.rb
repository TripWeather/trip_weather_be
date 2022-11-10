# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Show', :vcr do
  describe 'Trip Show' do
    before :each do
      @trip = create(:trip)
      @address1 = create(:address, location: "2303 Braun Ct, Golden CO 80401")
      @address2 = create(:address, location: "200 E Colfax Ave, Denver, CO 80203")
      @stop1 = create(:stop, trip_id: @trip.id, address_id: @address1.id, type_of_stop: 0)
      @stop2 = create(:stop, trip_id: @trip.id, address_id: @address2.id, type_of_stop: 2)
    end

    context('Happy Path') do
      it 'all :uid associated trip values are correct types' do
        get api_v1_trip_path('1000', @trip.id)
        expect(response).to have_http_status(200)

        trips_response = JSON.parse(response.body, symbolize_names: true)
        show_trip_type_check(trips_response[:data])
      end
    end

    context('Edge Path') do
      it 'returns a error message if :id does not exist' do
        id = 2
        get api_v1_trip_path('2000', id)
        expect(response).to have_http_status(404)

        error_response = JSON.parse(response.body, symbolize_names: true)
        show_not_found_check(error_response, id)
      end
    end
  end
  def show_trip_type_check(trip)
    expect(trip[:id]).to be_an String
    expect(trip[:type]).to eq 'trip'
    expect(trip[:attributes][:uid]).to be_an String
    expect(trip[:attributes][:name]).to be_an String
    expect(trip[:attributes][:departure_date]).to be_an String
    expect(trip[:attributes][:arrival_date]).to be_an String
  end

  def show_not_found_check(error_response, id)
    expect(error_response[:errors][0][:status]).to eq '404'
    expect(error_response[:errors][0][:title]).to eq 'Not Found'
    expect(error_response[:errors][0][:detail]).to eq "Couldn't find Trip with 'id'=#{id}"
  end
end
