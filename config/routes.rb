Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  resources :workshops do
    resources :workshop_registrations, except: :delete
    resources :bookings, except: :delete
    resources :ratings, except: [:new, :edit], controller: 'workshop_ratings'
    resources :images, only: [:create], controller: 'workshop_images'
    resources :workshop_sessions, only: [:create, :update, :destroy] do
      resources :comments, only: [:create]
      resources :participations, only: [:create]
    end
    get 'random', on: :collection
  end
  resources :categories, only: [:index, :show] do
    resources :workshops, only: [:index, :show]
  end
  resources :levels, only: [:index, :show]
  resources :users, except: [:index, :new, :edit, :create] do
    member do
      get :stripe_account_connect
    end
    resources :workshops, only: [:index], controller: 'user_workshops'
    resources :images, only: [:create], controller: 'user_images'
    resources :payment_methods, only: [:index, :destroy], controller: 'user_payment_methods'
  end

  post 'authenticate_with_facebook' => 'users#authenticate_with_facebook'
  get 'stripe_connect_callback' => 'stripe#connect_callback'
  get 'stripe_giropay_callback' => 'stripe#giropay_callback'
  post 'stripe_webhook' => 'stripe#event_webhook'
end
