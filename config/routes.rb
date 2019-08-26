Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # INDEX PRO => "/profiles"
  # SHOW PRO => "/profiles/:id"
  resources :profiles, only: { :index, :show} do

    # CREATE BOOKING => "/profiles/:id"
    ressources :bookings, only: :create
  end

  # SHOW BOOKINGS => "/bookings/:id"
  resources :bookings, only: { :show } do

    # CREATE MESSAGE => "/bookings/:id/messages"
    resources :messages, only: :create

    # CREATE REVIEW => /bookings/:id/reviews
    resources :reviews, only: :create
  end

  # CANCEL BOOKING => /bookings/:id/cancel
  PATCH 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_booking

  # UPDATE BOOKING => /bookings/:id/edit
  resources :bookings, only: :update
end
