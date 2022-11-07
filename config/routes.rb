# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :nav, only: [:index]
      get '/nav', to: 'nav#index'
      get '/weather', to: 'weather#index'
      scope ':user_id' do
        resources :trips do
          resources :stops, only: %i[index show] do
            resources :addresses, only: %i[show]
          end
        end
      end
    end
  end
end
