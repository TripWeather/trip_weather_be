# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  context '#forecast' do
    it 'takes service response and creates a weather object' do
      expect(WeatherFacade.forecast(39.7456, -97.0892)).to be_an(Weather)
    end
  end 

  context '#convert_forecast_data_to_weather_obj' do
    it 'takes takes an array of forecast hashes, and slices attributes, returns array of weather objects' do
      array_of_forecast_hashes = [{
                                  :number=>1,
                                  :name=>"This Afternoon",
                                  :startTime=>"2022-11-05T17:00:00-05:00",
                                  :endTime=>"2022-11-05T18:00:00-05:00",
                                  :isDaytime=>true,
                                  :temperature=>59,
                                  :temperatureUnit=>"F",
                                  :temperatureTrend=>nil,
                                  :windSpeed=>"15 mph",
                                  :windDirection=>"SW",
                                  :icon=>"https://api.weather.gov/icons/land/day/few?size=medium",
                                  :shortForecast=>"Sunny",
                                  :detailedForecast=>"Sunny, with a high near 59. Southwest wind around 15 mph, with gusts as high as 30 mph."},

                                {:number=>2,
                                  :name=>"Tonight",
                                  :startTime=>"2022-11-05T18:00:00-05:00",
                                  :endTime=>"2022-11-06T06:00:00-06:00",
                                  :isDaytime=>false,
                                  :temperature=>40,
                                  :temperatureUnit=>"F",
                                  :temperatureTrend=>nil,
                                  :windSpeed=>"5 to 20 mph",
                                  :windDirection=>"SW",
                                  :icon=>"https://api.weather.gov/icons/land/night/few?size=medium",
                                  :shortForecast=>"Mostly Clear",
                                  :detailedForecast=>"Mostly clear, with a low around 40. Southwest wind 5 to 20 mph, with gusts as high as 30 mph."
                                }]

      expect(WeatherFacade.convert_forecast_data_to_weather_obj(array_of_forecast_hashes)).to be_an(Array)
      expect(WeatherFacade.convert_forecast_data_to_weather_obj(array_of_forecast_hashes).first).to be_a(Weather)
      expect(WeatherFacade.convert_forecast_data_to_weather_obj(array_of_forecast_hashes).second).to be_a(Weather)
    end
  end

  context '#day_of_week' do 
    it 'takes date as arg, and returns the day of week name as string' do
      date = "Sun, 06 Nov 2022 11:05:51 -0700".to_datetime
      return_value = WeatherFacade.day_of_week(date)

      expect(return_value).to eq("Sunday")
    end
  end

  context '#forecast_for_day' do
    it 'takes lat/long and weekday string name as arg, returns day and evening forecast for that day' do
      latitude = 38.8977
      longitude = -77.0365
      weekday = "Saturday"
      return_value = WeatherFacade.forecast_for_day(latitude, longitude, weekday)

      expect(return_value).to be_an(Array)
      expect(return_value.first).to be_a(Hash)
      expect(return_value.first).to have_key(:number)
      expect(return_value.first).to have_key(:name)
      expect(return_value.first[:name].include?("Saturday")).to be(true)
      expect(return_value.first).to have_key(:shortForecast)
      expect(return_value.first).to have_key(:detailedForecast)
    end
  end

  context '#advance_forecast_start_address' do
    it 'takes start address and departure date, and returns weather objects for that start address' do
      start_address = "3210 Youngfield St, Wheat Ridge, CO 80033"
      departure_date =  "Sun, 13 Nov 2022 11:05:51 -0700".to_datetime
      return_value = WeatherFacade.advance_forecast_start_address(start_address, departure_date)

      expect(return_value).to be_an(Array)
      expect(return_value.first).to be_a(Weather)
    end
  end

  context '#advance_forecast_end_address' do
    it 'takes end address and arrival date, and returns weather objects for that end address' do
      end_address = "3210 Youngfield St, Wheat Ridge, CO 80033"
      arrival_date =  "Sun, 13 Nov 2022 11:05:51 -0700".to_datetime
      return_value = WeatherFacade.advance_forecast_end_address(end_address, arrival_date)

      expect(return_value).to be_an(Array)
      expect(return_value.first).to be_a(Weather)
    end
  end
end
