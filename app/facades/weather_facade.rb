# frozen_string_literal: true

class WeatherFacade < WeatherService
  def self.forecast(latitude, longitude)
    forecast_response = forecast_data(latitude, longitude)
    weather_attr_hash = forecast_response[:properties][:periods][0].slice(:name, :temperature, :shortForecast, :detailedForecast)
    Weather.new(weather_attr_hash)
  end

  def self.convert_forecast_data_to_weather_obj(array_of_forecast_hashes)
    weather_objects = []
    array_of_forecast_hashes.each do |forecast_hash|
      forecast = forecast_hash.slice(:name, :temperature, :shortForecast, :detailedForecast)
      weather_objects << Weather.new(forecast)
    end
    weather_objects
  end

  def self.day_of_week(date)
    Date::DAYNAMES[date.wday]
  end

  def self.forecast_for_day(latitude, longitude, weekday)
    seven_day_forecasts = forecast_data(latitude, longitude)
    selected_forecasts = seven_day_forecasts[:properties][:periods].find_all do |forecast|
      forecast[:name].include?(weekday)
    end
  end

  def self.advance_forecast_start_address(start_address, departure_date)
    todays_date = DateTime.now
    if todays_date < departure_date
      difference_of_days_between_now_and_departure = (departure_date - todays_date).to_i 
    end
    departure_day = day_of_week(departure_date)
    starting_coord = LatLongFacade.lat_long_object(start_address)
    if difference_of_days_between_now_and_departure < 7 
      selected_forecasts = forecast_for_day(starting_coord.latitude, starting_coord.longitude, departure_day)
    end
    convert_forecast_data_to_weather_obj(selected_forecasts)
  end

  def self.advance_forecast_end_address(end_address, arrival_date)
    todays_date = DateTime.now
    if todays_date < arrival_date
      difference_of_days_between_now_and_arrival_date = (arrival_date - todays_date).to_i 
    end
    arrival_day = day_of_week(arrival_date)
    end_coord = LatLongFacade.lat_long_object(end_address)
    if difference_of_days_between_now_and_arrival_date < 7 
      selected_forecasts = forecast_for_day(end_coord.latitude, end_coord.longitude, arrival_day)
    end
    convert_forecast_data_to_weather_obj(selected_forecasts)
  end
end