Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :bookings
    resources :equipements
    resources :messages
    resources :reviews
    resources :skills

    root to: "users#index"
  end

  namespace :pro do
    resources :bookings, only: [:index, :show, :update]
  end

  devise_for :users

  root to: 'pages#home'

  resources :user, only: [] do
    resources :messages, only: :create
    resources :bookings, only: :create
  end

  # INDEX PRO => "/profiles"
  # SHOW PRO => "/profiles/:id"

  resources :profiles, only: [ :index, :show ] do

    # CREATE BOOKING => "/profiles/:id"
    resource :bookings, only: :create
  end

  # SHOW BOOKINGS => "/bookings/:id"

  resources :bookings, only: :show do

    # CREATE REVIEW => /bookings/:id/reviews
    resources :reviews, only: :create
  end

  # CANCEL BOOKING => /bookings/:id/cancel
  patch 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_booking

  # UPDATE BOOKING => /bookings/:id/edit
  resource :bookings, only: :update
end
