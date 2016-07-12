Rails.application.routes.draw do
  resources :participations
  resources :workshop_registrations
  resources :bookings
  resources :workshop_sessions
  resources :workshops
  resources :venues
  resources :comments
  resources :ratings
  resources :levels
  resources :tags
  resources :categories, only: [:index, :show]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
end
