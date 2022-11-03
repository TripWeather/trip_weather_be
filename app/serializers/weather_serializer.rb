# frozen_string_literal: true

class WeatherSerializer
  include JSONAPI::Serializer
  attributes :name, :temperature, :short_forecast
end
