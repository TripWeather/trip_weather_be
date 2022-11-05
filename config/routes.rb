# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope ':user_id' do
        resources :trips
      end
    end
  end
end
