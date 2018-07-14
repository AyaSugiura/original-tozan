Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "managers/login", to: "sessions#new"
  post "managers/login", to: "sessions#create"
  delete "managers/logout", to: "sessions#destroy"

  resources :managers, only: [:index]
  
  resources :mountains
end
