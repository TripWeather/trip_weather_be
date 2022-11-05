# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Destroy' do
  describe 'Trip Destroy' do
    let!(:load_obj) { @trip = trip_initialize_has_many('1000', 1) }
    context('Happy Path') do
      it 'can destroy a Trip associated to its :id' do
        expect { delete api_v1_trip_path('1000', @trip) }.to change(Trip, :count).by(-1)

        expect(response).to have_http_status(204)

        expect { Trip.find(@trip.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context('Edge Path') do
      it 'returns a error message if :id does not exist' do
        id = 1000
        delete api_v1_trip_path('9898989', id)
        expect(response).to have_http_status(404)

        error_response = JSON.parse(response.body, symbolize_names: true)
        destroy_not_found_check(error_response, id)
      end
    end
  end
  def destroy_not_found_check(error_response, id)
    expect(error_response[:errors][0][:status]).to eq '404'
    expect(error_response[:errors][0][:title]).to eq 'Not Found'
    expect(error_response[:errors][0][:detail]).to eq "Couldn't find Trip with 'id'=#{id}"
  end
end
