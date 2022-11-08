# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      def show
        render json: AddressSerializer.new(Address.find(params[:id]))
      end

      def update
        render json: AddressSerializer.new(Address.update(params[:id], address_params))
      end

      private

      def address_params
        params.require(:address).permit(:location)
      end
    end
  end
end
