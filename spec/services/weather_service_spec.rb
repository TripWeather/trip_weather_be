# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  describe 'all_weather_data' do
    it 'should return all weather data for a given latitude/longitude' do
      weather_service_call = WeatherService.all_weather_data(39.7456, -97.0892)

      expect(weather_service_call[:properties][:forecast]).to eq('https://api.weather.gov/gridpoints/TOP/31,80/forecast')
      expect(weather_service_call[:properties][:forecast]).to be_an(String)
    end
  end

  describe 'forecast_data' do
    it 'should return forcast data for a given latitude/longitude' do
      forecast_call = WeatherService.forecast_data(39.7456, -97.0892)

      expect(forecast_call[:properties][:periods][0][:temperature]).to eq(58)
      expect(forecast_call[:properties][:periods][0][:temperature]).to be_an(Integer)

      expect(forecast_call[:properties][:periods][0][:shortForecast]).to eq('Partly Cloudy')
      expect(forecast_call[:properties][:periods][0][:shortForecast]).to be_an(String)

      expect(forecast_call[:properties][:periods][0][:detailedForecast]).to eq('Partly cloudy, with a low around 58. South wind 15 to 20 mph, with gusts as high as 40 mph.')
      expect(forecast_call[:properties][:periods][0][:detailedForecast]).to be_an(String)
    end
  end
end
