# frozen_string_literal: true

module Api
  module V1
    class StopsController < ApplicationController
      def index
        render json: StopSerializer.new(Trip.find(params[:trip_id]).stops)
      end

      def show
        render json: StopSerializer.new(Stop.find(params[:id]))
      end
    end
  end
end
