# frozen_string_literal: true

Rails.application.routes.draw do
  resources :addresses
  resources :stops
  resources :trips
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create]
    end
  end
end
