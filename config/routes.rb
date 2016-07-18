Rails.application.routes.draw do
  resources :workshops do
    resources :participations
    resources :workshop_registrations, except: :delete
    resources :bookings, except: :delete
    resources :workshop_sessions do
      resources :comments, only: [:create]
      resources :ratings, only: [:create]
    end
  end
  resources :categories, only: [:index, :show]
  resources :venues, only: [:index, :create]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
end
