# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather do
  weather_hash = { name: 'This Afternoon', temperature: 74, shortForecast: 'Partly Sunny',
                   detailedForecast: 'Partly sunny, with a high near 74. South wind 20 to 25 mph, with gusts as high as 40 mph.' }

  it 'instantiates' do
    weather1 = Weather.new(weather_hash)

    expect(weather1).to be_an(Weather)
  end

  it 'has attributes' do
    weather1 = Weather.new(weather_hash)

    expect(weather1.name).to eq(weather_hash[:name])
    expect(weather1.temperature).to eq(weather_hash[:temperature])
    expect(weather1.short_forecast).to eq(weather_hash[:shortForecast])
    expect(weather1.detailed_forecast).to eq(weather_hash[:detailedForecast])
  end
end
