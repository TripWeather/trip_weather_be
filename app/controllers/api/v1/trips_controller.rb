# frozen_string_literal: true

module Api
  module V1
    class TripsController < ApplicationController
      def index
        render json: TripSerializer.new(Trip.where(uid: params[:user_id]))
      end

      def show
        render json: TripSerializer.new(Trip.find(params[:id]))
      end

      def destroy
        Trip.destroy(params[:id])
      end
    end
  end
end
