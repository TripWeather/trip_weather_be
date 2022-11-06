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
          departure_date: Time.current + 30.seconds,
          arrival_date: Time.current + 10.days
        }
        headers = { CONTENT_TYPE: 'application/json' }

        put api_v1_trip_path('1000', @trip), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(200)

        trip_response = JSON.parse(response.body, symbolize_names: true)
        update_trip_obj_check(trip_response[:data], trip)
      end
    end

    context('Edge Case') do
      it 'returns Unprocessable Entity if date is in past' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: Time.current + 5.days,
          arrival_date: Time.current - 5.days
        }
        headers = { CONTENT_TYPE: 'application/json' }
        put api_v1_trip_path('1000', @trip), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(422)


        error_response = JSON.parse(response.body, symbolize_names: true)
        update_unproc_entity_check(error_response, ["Arrival date can't be in the past", "Arrival date can't before departure date"])
      end

      it 'returns Unprocessable Entity if arrival date is before departure date' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: Time.current + 5.days,
          arrival_date: Time.current + 2.days
        }
        headers = { CONTENT_TYPE: 'application/json' }
        put api_v1_trip_path('1000', @trip), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(422)

        error_response = JSON.parse(response.body, symbolize_names: true)
        update_unproc_entity_check(error_response, ["Arrival date can't before departure date"])
      end
    end
  end
  def update_trip_obj_check(trip_response, trip)
    expect(trip_response[:id]).to be_an String
    expect(trip_response[:type]).to eq 'trip'
    expect(trip_response[:attributes][:uid]).to eq trip[:uid]
    expect(trip_response[:attributes][:name]).to eq trip[:name]
    expect(trip_response[:attributes][:departure_date]).to eq trip[:departure_date].strftime('%FT%T.000Z')
    expect(trip_response[:attributes][:arrival_date]).to eq trip[:arrival_date].strftime('%FT%T.000Z')
  end

  def update_unproc_entity_check(error_response, errors)
    expect(error_response[:errors][0][:status]).to eq '422'
    expect(error_response[:errors][0][:title]).to eq 'Unprocessable Entity'
    expect(error_response[:errors][0][:detail]).to eq errors
  end
end
