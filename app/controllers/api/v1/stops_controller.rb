# frozen_string_literal: true

module Api
  module V1
    class StopsController < ApplicationController
      def index
        render json: StopSerializer.new(Trip.find(params[:trip_id]).ordered_stops)
      end

      def show
        render json: StopSerializer.new(Stop.find(params[:id]))
      end

      def create
        stop_type_check = stop_params[:type_of_stop].to_i if !stop_params[:type_of_stop].nil? 
        address = Address.create!(location: stop_params[:location])
        render json: StopSerializer.new(Stop.create!(trip_id: params[:trip_id], address_id: address.id, type_of_stop: stop_type_check)), status: 201
      end

      def destroy
        Stop.destroy(params[:id])
      end

      private

      def stop_params
        params.require(:stop).permit(:type_of_stop, :location)
      end
    end
  end
end
