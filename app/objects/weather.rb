# frozen_string_literal: true

class Weather
  attr_reader :name, :temperature, :short_forecast, :detailed_forecast, :id

  def initialize(weather_hash)
    @id = 1
    @name = weather_hash[:name]
    @temperature = weather_hash[:temperature]
    @short_forecast = weather_hash[:shortForecast]
    @detailed_forecast = weather_hash[:detailedForecast]
  end
end
