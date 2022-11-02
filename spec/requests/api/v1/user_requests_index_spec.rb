# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API | Create' do
  describe 'User Create' do
    context('Happy Path') do
      let!(:users_creation) { create_list(:user, 5) }
      it 'creates a user with given params' do
        get api_v1_users_path

        expect(response).to have_http_status 200

        users_response = JSON.parse(response.body, symbolize_names: true)

        users_response[:data].each { |user| user_response_attr(user) }
      end
    end
    context('Sad Path') do
      it 'if no users are present, an empty array is returned' do
        get api_v1_users_path

        expect(response).to have_http_status 200

        users_response = JSON.parse(response.body, symbolize_names: true)

        expect(users_response).to eq data: []
      end
    end
  end
end

private

def user_response_attr(user)
  expect(user[:id]).to be_an String
  expect(user[:type]).to eq 'user'
  expect(user[:attributes]).to be_an Hash
  expect(user[:attributes].count).to eq 5
  expect(user.dig(:attributes, :full_name)).to be_an String
  expect(user.dig(:attributes, :first_name)).to be_an String
  expect(user.dig(:attributes, :last_name)).to be_an String
  expect(user.dig(:attributes, :email)).to be_an String
  expect(user.dig(:attributes, :image)).to be_an String
end
