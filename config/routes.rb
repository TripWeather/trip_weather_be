# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :nav, only: [:index]
      get '/nav', to: 'nav#index'
      get '/weather', to: 'weather#index'
      scope ':user_id' do
        resources :trips do
          resources :stops, except: %i[new update] do
            resources :addresses, only: %i[show update]
          end
        end
      end
    end
  end
end
