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

      # post api_v1_nav_index_path, { "QUERY_STRING" => "start_address=12230 Washington Center Pkwy, Thornton, CO 80241" }, { "QUERY_STRING" => "end_address=2303 Braun Ct, Golden, CO 80401" }
      
      #headers: headers, params: JSON.generate(start_address, end_address)

      headers = {"CONTENT_TYPE" => "application/json"}

      # post api_v1_nav_index_path
      get '/api/v1/nav', headers: headers, params: JSON.generate(address_params)

      expect(response).to be_successful
    end
  end
end
