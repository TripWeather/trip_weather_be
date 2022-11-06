# frozen_string_literal: true

class WeatherFacade < WeatherService
  def self.forecast(latitude, longitude)
    forecast_response = forecast_data(latitude, longitude)
    weather_attr_hash = forecast_response[:properties][:periods][0].slice(:name, :temperature, :shortForecast, :detailedForecast)
    Weather.new(weather_attr_hash)
  end
end

# def weather day 1
# def weather day 2
# def map periods, we can idenfity by weather_object.name which day or day/night we want
