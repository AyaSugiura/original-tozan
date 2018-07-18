Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "toppages/message", to: "toppages#messages"
  
  get "managers/login", to: "sessions#new"
  post "managers/login", to: "sessions#create"
  delete "managers/logout", to: "sessions#destroy"

  resources :managers, only: [:index]
  
  get "mountains/owari", to:"mountains#owari"
  get "mountains/nishimikawa", to:"mountains#nishimikawa"
  get "mountains/okumikawa", to: "mountains#okumikawa"
  get "mountains/higashimikawa", to:"mountains#higashimikawa"
  get "mountains/china", to:"mountains#china"
  
  get "toppages/message", to: "toppages#message" 
  
  resources :mountains do
    resources :photos, only: [:new, :create, :index, :edit, :update]
  end
  
  resources :photos, only: [:destroy, :show]

  resources :galleries
  
  resources :information, only:[:new, :create, :destroy ]
  
end
