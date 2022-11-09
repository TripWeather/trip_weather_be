# frozen_string_literal: true

module Api
  module V1
    class WeatherController < ApplicationController
      def index
        # address = JSON.parse(params.keys.first, symbolize_names: true)
        # require 'pry'; binding.pry
        address = params[:address]
        lat_long = LatLongFacade.lat_long_object(address)
        render json: WeatherSerializer.new(WeatherFacade.forecast(lat_long.latitude, lat_long.longitude))
      end
    end
  end
end