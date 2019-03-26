Rails.application.routes.draw do
  
  devise_for :users
  root to: "rentals#new"

  resources :rentals, only: [:show, :create, :update, :index]
  resources :documents
  resources :photos
  get "/verification", to: "verification_sessions#create"

  post "/webhooks/receive", to: "webhooks#receive"
end
