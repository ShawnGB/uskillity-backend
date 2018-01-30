Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :workshops do
    resources :participations
    resources :workshop_registrations, except: :delete
    resources :bookings, except: :delete
    resources :ratings, except: [:new, :edit], controller: 'workshop_ratings'
    resources :images, only: [:create], controller: 'workshop_images'
    resources :workshop_sessions do
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
  #resources :venues, only: [:index, :create]
  #devise_for :users, :controllers => {
    #:omniauth_callbacks => "users/omniauth_callbacks",
    #:registrations      => "users/registrations"
  #}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get 'pages/share_details' => 'pages#share_details'
  get 'pages/looking_around' => 'pages#looking_around'
  get 'pages/inspiration' => 'pages#inspiration'
  get 'pages/impressum' => 'pages#impressum'
  get 'pages/contact' => 'pages#contact'
end
