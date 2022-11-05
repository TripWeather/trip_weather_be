# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Create' do
  describe 'Trip Create' do
    context('Happy Path') do
      it 'creates a new trip' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: DateTime.now + 5.days,
          arrival_date: DateTime.now + 10.days
        }
        headers = { CONTENT_TYPE: 'application/json' }

        expect do
          post api_v1_trips_path('1000'), headers: headers, params: JSON.generate(trip: trip)
        end.to change(Trip, :count).by(+1)

        expect(response).to have_http_status(201)

        trip_response = JSON.parse(response.body, symbolize_names: true)
        create_trip_obj_check(trip_response[:data], trip)
      end
    end

    context('Edge Case') do
      it 'returns an error message if missing attributes' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s
        }
        headers = { CONTENT_TYPE: 'application/json' }
        expect do
          post api_v1_trips_path('1000'), headers: headers, params: JSON.generate(trip: trip)
        end.to change(Trip, :count).by(0)

        expect(response).to have_http_status(422)

        error_response = JSON.parse(response.body, symbolize_names: true)
        create_unproc_entity_check(error_response)
      end

      xit 'returns bad request if date is in past' do
        trip = {
          uid: Faker::Number.number(digits: 10).to_s,
          name: Faker::Movies::StarWars.planet,
          departure_date: DateTime.now + 2.0,
          arrival_date: DateTime.now - 5
        }
        headers = { CONTENT_TYPE: 'application/json' }
        post api_v1_trips_path('1000'), headers: headers, params: JSON.generate(trip: trip)

        expect(response).to have_http_status(400)

        error_response = JSON.parse(response.body, symbolize_names: true)
        create_bad_request_check(error_response)
      end
    end
  end
  def create_trip_obj_check(trip_response, trip)
    expect(trip_response[:id]).to be_an String
    expect(trip_response[:type]).to eq 'trip'
    expect(trip_response[:attributes][:uid]).to eq trip[:uid]
    expect(trip_response[:attributes][:name]).to eq trip[:name]
    expect(trip_response[:attributes][:departure_date]).to be_an String
    expect(trip_response[:attributes][:arrival_date]).to be_an String
  end

  def create_unproc_entity_check(error_response)
    expect(error_response[:errors][0][:status]).to eq '422'
    expect(error_response[:errors][0][:title]).to eq 'Unprocessable Entity'
    expect(error_response[:errors][0][:detail]).to eq ["Name can't be blank", "Departure date can't be blank", "Arrival date can't be blank"]
  end

  def create_bad_request_check(error_response)
    expect(error_response[:errors][0][:status]).to eq '400'
    expect(error_response[:errors][0][:title]).to eq 'Bad Request'
    expect(error_response[:errors][0][:detail]).to eq 'Date cannot be in the past'
  end
end

