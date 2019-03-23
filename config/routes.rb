Rails.application.routes.draw do
  
  devise_for :users
  root to: "rentals#new"

  resources :rentals, only: [:show, :create, :update]
  resources :sessions, only: [:create, :destroy]
end
