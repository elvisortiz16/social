Rails.application.routes.draw do
  root "sessions#create"

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get "/home", to: "home#index"
  
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
end