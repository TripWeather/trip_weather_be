# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trips API | Index' do
  describe 'Trip Index' do
    let!(:load_obj) { trip_initialize_has_many(1) }
    context('Happy Path') do
      it 'returns an index of trips' do
        get api_v1_trips_path
      end
    end

    context('Sad Path') do

    end

    context('Edge Case') do

    end
  end
end

