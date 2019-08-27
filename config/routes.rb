Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # INDEX PRO => "/profiles"
  # SHOW PRO => "/profiles/:id"
  resource :profiles, only: [ :index, :show ] do

    # CREATE BOOKING => "/profiles/:id"
    ressources :bookings, only: :create
  end

  # SHOW BOOKINGS => "/bookings/:id"
  resource :bookings, only: :show  do

    # CREATE MESSAGE => "/bookings/:id/messages"
    resource :messages, only: :create

    # CREATE REVIEW => /bookings/:id/reviews
    resource :reviews, only: :create
  end

  # CANCEL BOOKING => /bookings/:id/cancel
  PATCH 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel_booking

  # UPDATE BOOKING => /bookings/:id/edit
  resource :bookings, only: :update
end
