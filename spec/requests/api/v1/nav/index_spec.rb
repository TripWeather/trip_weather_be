# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Nav API | Index' do
  describe 'Nav Index', :vcr do
    it 'render JSON of Nav Object for addresses sent in query' do

      address_params = ({
        start_address: "12230 Washington Center Pkwy, Thornton, CO 80241",
        end_address: "2303 Braun Ct, Golden, CO 80401",
        id: 1
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/nav', headers: headers, params: JSON.generate(address_params)

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to have_key(:id)
      expect(parsed_response[:data]).to have_key(:attributes)
      expect(parsed_response[:data][:attributes]).to have_key(:turn_by_turn_directions)
      expect(parsed_response[:data][:attributes]).to have_key(:total_trip_time)
      expect(parsed_response[:data][:attributes]).to have_key(:total_distance)
      expect(parsed_response[:data][:attributes]).to have_key(:has_toll_road)
    end
  end
end
