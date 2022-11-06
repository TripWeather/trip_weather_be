# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weather API | Index' do
  describe 'Weather Index', :vcr do
    it 'render JSON of Weather Object for an addresses sent in query' do

      address_params = ({
        address: "12230 Washington Center Pkwy, Thornton, CO 80241",
      })

      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/weather', headers: headers, params: JSON.generate(address_params)
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to have_key(:id)
      expect(parsed_response[:data]).to have_key(:attributes)
      expect(parsed_response[:data][:attributes]).to have_key(:name)
      expect(parsed_response[:data][:attributes]).to have_key(:temperature)
      expect(parsed_response[:data][:attributes]).to have_key(:short_forecast)
      expect(parsed_response[:data][:attributes]).to have_key(:detailed_forecast)
    end
  end
end
