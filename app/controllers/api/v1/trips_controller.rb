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

      def create
        render json: TripSerializer.new(Trip.create!(trip_params)), status: 201
      end

      def update
        render json: TripSerializer.new(Trip.update(trip_params))
      end

      private

      def trip_params
        params.require(:trip).permit(:uid, :name, :departure_date, :arrival_date)
      end
    end
  end
end
