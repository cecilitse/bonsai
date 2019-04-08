require 'api_constraints'

Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :plants, only: [:index, :show]
  resources :users , only: [:show]

  resource  :leaderboard, only: [:show], controller: 'leaderboard'

  namespace :garden do
    root to: 'dashboard#show'

    resources :care_moments, only: [:index]

    resources :plants do
      resource  :favorite,     only: [:create, :destroy]
      resources :care_moments, only: [:create]
    end
  end

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :plants, only: [:index]
    end
  end
end
