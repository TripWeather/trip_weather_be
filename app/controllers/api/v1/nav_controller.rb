# frozen_string_literal: true

module Api
  module V1
    class NavController < ApplicationController
      def index
        # addresses = JSON.parse(params.keys.first, symbolize_names: true)
        render json: NavSerializer.new(NavFacade.nav_object(params[:start_address], params[:end_address]))
      end
    end
  end
end