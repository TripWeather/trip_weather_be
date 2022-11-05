# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      def index
        stop = Stop.find(params[:stop_id])
        render json: AddressSerializer.new(stop.address)
      end
    end
  end
end
