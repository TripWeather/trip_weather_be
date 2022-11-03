# frozen_string_literal: true

module Api
  module V1
    class TripsController < ApplicationController
      def index
        render json: TripSerializer.new(Trip.where(uid: params[:user_id]))
      end
    end
  end
end
