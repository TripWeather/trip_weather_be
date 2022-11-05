# frozen_string_literal: true

module Api
  module V1
    class NavController < ApplicationController
      def index
        addresses = JSON.parse(params.keys.first, symbolize_names: true)
        render json: NavSerializer.new(NavFacade.nav_object(addresses[:start_address], addresses[:end_address]))
        JSON.parse(params.body, symbolize_names: true)

      end
    end
  end
end