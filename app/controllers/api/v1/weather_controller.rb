# frozen_string_literal: true

module Api
  module V1
    class WeatherController < ApplicationController
      def index
        lat_long = LatLong.lat_long_object(params[:address])
        render json: WeatherSerializer.new(WeatherFacade.forecast(lat_long.latitude, lat_long.longitude))
      end
    end
  end
end