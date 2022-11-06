# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weather API | Index' do
  describe 'Weather Index', :vcr do
    it 'render JSON of Weather Object for an addresses sent in query' do

      address_params = ({
        address: "12230 Washington Center Pkwy, Thornton, CO 80241",
        # end_address: "2303 Braun Ct, Golden, CO 80401",
        # id: 1
      })

      headers = {"CONTENT_TYPE" => "application/json"}


      get '/api/v1/weather', headers: headers, params: JSON.generate(address_params)
      require 'pry'; binding.pry
      expect(response).to be_successful
    end
  end
end
