# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      def show
        render json: AddressSerializer.new(Address.find(params[:id]))
      end
    end
  end
end
