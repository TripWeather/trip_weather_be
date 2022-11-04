# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Create' do
  describe 'Trip Create' do
    context('Happy Path') do
      it 'creates a new trip' do
        trip = build(:trip)
        headers = { CONTENT_TYPE: 'application/json' }

        post api_v1_trips_path, headers: headers, params: JSON.generate(trip: trip)
        binding.pry
        expect(response).to have_http_status(201)
      end
    end

    context('Edge Case') do
      it 'returns an error message if missing attributes' do

      end
    end
  end
end