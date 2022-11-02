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

        users_response.each { |user| user_response_attr(user) }
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
  binding.pry
end
