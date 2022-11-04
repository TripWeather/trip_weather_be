# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  it 'takes service response and creates a weather object' do
    expect(WeatherFacade.forecast(39.7456, -97.0892)).to be_an(Weather)
  end
end
