# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope ':user_id' do
        resources :trips, only: %i[index show destroy]
      end
    end
  end
end
