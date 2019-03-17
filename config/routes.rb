Rails.application.routes.draw do
  
  devise_for :users
  resources :sessions, only: [:create, :destroy]
  root to: "home#index"
end
