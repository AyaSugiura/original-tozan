Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "managers/login", to: "sessions#new"
  post "managers/login", to: "sessions#create"
  delete "managers/logout", to: "sessions#destroy"

  resources :managers, only: [:index]
  
  get "mountains/owari", to:"mountains#owari"
  get "mountains/nishimikawa", to:"mountains#nishimikawa"
  get "mountains/okumikawa", to: "mountains#okumikawa"
  get "mountains/higashimikawa", to:"mountains#higashimikawa"
  get "mountains/china", to:"mountains#china"
   
  get "mountains/:id/photo", to:"mountains#photo"
  
  resources :mountains

  resources :photos
  
  resources :galleries
  
end
