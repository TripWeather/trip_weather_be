# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API | Create' do
  describe 'User Create' do
    context('Happy Path') do
      let(:user) do
        {
          name: 'Bob Short',
          email: 'bobshort@gmail.com',
          first_name: 'Bob',
          last_name: 'Short',
          image: 'https://jpeg.org/images/jpegsystems-home.jpg',
          uid: '39856359639539',
          token: 'flkasgfokahjbfwlkafbawhjfgal'
        }
      end
      it 'creates a user with given params' do
        headers = { CONTENT_TYPE: 'application/json' }

        post api_v1_users_path, headers: headers, params: JSON.generate(user: user)

        expect(response).to have_http_status 201

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(user_response).to eq user_parsed_body
      end
    end
    context('Edge Path') do
      it 'returns a status 400 if no params passed' do
        headers = { CONTENT_TYPE: 'application/json' }

        post api_v1_users_path, headers: headers, params: JSON.generate(user: {})

        expect(response).to have_http_status 400

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(error_response).to eq bad_request_parsed_body
      end

      it 'returns a status 422 if required param is not passed' do
        headers = { CONTENT_TYPE: 'application/json' }

        post api_v1_users_path, headers: headers, params: JSON.generate(user: { full_name: 'Bob Short' })

        expect(response).to have_http_status 422

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(error_response).to eq unprocessable_parsed_body
      end
    end
  end
end

private

def user_parsed_body
  {
    data: {
      id: User.last.id.to_s,
      type: 'user',
      attributes: {
        full_name: 'Bob Short', first_name: 'Bob', last_name: 'Short', email: 'bobshort@gmail.com', image: 'https://jpeg.org/images/jpegsystems-home.jpg'
      }
    }
  }
end

def bad_request_parsed_body
  { message: 'your query could not be completed',
    errors: [{ status: '400', title: 'Bad Request', detail: 'param is missing or the value is empty: user' }] }
end

def unprocessable_parsed_body
  { errors: [{ detail: ["Email can't be blank"], status: '422', title: 'Unprocessable Entity' }], 
    message: 'your query could not be completed' }
end
