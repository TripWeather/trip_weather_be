# frozen_string_literal: true

module Api
  module V1
    class TripsController < ApplicationController
      before_action :format_date, only: %i[create update]
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
        trip = Trip.update(params[:id], trip_params)
        raise ActiveRecord::RecordInvalid, trip unless trip.valid?

        render json: TripSerializer.new(Trip.update(params[:id], trip_params))
      end

      private

      def trip_params
        params.require(:trip).permit(:uid, :name, :departure_date, :arrival_date)
      end

      def format_date
        format_departure_date
        format_arrival_date
      end

      def format_departure_date
        return unless params[:trip][:departure_date]

        params[:trip][:departure_date] = Time.parse(params[:trip][:departure_date]).strftime('%a, %d %b %Y %H:%M:%S')
      end

      def format_arrival_date
        return unless params[:trip][:arrival_date]

        params[:trip][:arrival_date] = Time.parse(params[:trip][:arrival_date]).strftime('%a, %d %b %Y %H:%M:%S')
      end
    end
  end
end
