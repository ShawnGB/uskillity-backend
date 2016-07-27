Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations      => "users/registrations"
  }
  devise_scope :user do
    get 'users/register' => 'users/registrations#register', as: :new_user_mailinglist_registration
    post 'users/register' => 'users/registrations#create', as: :user_mailinglist_registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
end
