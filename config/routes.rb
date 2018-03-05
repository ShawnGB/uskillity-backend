Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  resources :workshops do
    resources :participations
    resources :workshop_registrations, except: :delete
    resources :bookings, except: :delete
    resources :ratings, except: [:new, :edit], controller: 'workshop_ratings'
    resources :images, only: [:create], controller: 'workshop_images'
    resources :workshop_sessions, only: [:create, :update, :destroy] do
      resources :comments, only: [:create]
    end
    get 'random', on: :collection
  end
  resources :categories, only: [:index, :show] do
    resources :workshops, only: [:index, :show]
  end
  resources :levels, only: [:index, :show]
  resources :users, except: [:index, :new, :edit, :create] do
    resources :workshops, only: [:index], controller: 'user_workshops'
    resources :images, only: [:create], controller: 'user_images'
  end

  post 'authenticate_with_facebook' => 'users#authenticate_with_facebook'
end
