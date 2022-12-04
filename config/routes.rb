Rails.application.routes.draw do
  root "home#index"
  namespace :sessions do
    resource :sudo, only: [:new, :create]
  end
  namespace :two_factor_authentication do
    resource :challenge, only: [:new, :create]
    resource :totp,      only: [:new, :create]
  end
  get  '/auth/failure',            to: 'sessions/omniauth#failure'
  get  '/auth/:provider/callback', to: 'sessions/omniauth#create'
  post '/auth/:provider/callback', to: 'sessions/omniauth#create'
  get  'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get  'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:edit, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
