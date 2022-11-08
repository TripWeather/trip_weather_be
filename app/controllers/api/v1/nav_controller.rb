# frozen_string_literal: true

module Api
  module V1
    class NavController < ApplicationController
      def index
        render json: NavSerializer.new(NavFacade.nav_object(params[:from], params[:to]))
      end
    end
  end
end