class WeatherService

  def self.connection
    Faraday.new(
      url: 'https://api.weather.gov/'
    )
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.all_weather_data(latitude, longitude)
    response = connection.get("points/#{latitude},#{longitude}")
    parse(response)
  end

  def self.forecast_data(latitude, longitude)
    all_weather_data_response = all_weather_data(latitude, longitude)
    forecast_uri = all_weather_data_response[:properties][:forecast]
    response = Faraday.get(forecast_uri)
    parse(response)
  end
end