Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'

  resources :user, only: [] do
    resources :messages, only: :create
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
    resource :reviews, only: :create
  end

  # CANCEL BOOKING => /bookings/:id/cancel
  patch 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_booking

  # UPDATE BOOKING => /bookings/:id/edit
  resource :bookings, only: :update
end
