Rails.application.routes.draw do
  root "sessions#create"

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :posts, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :comments, only: [:new, :create, :edit, :update, :show, :destroy]

  get "/home", to: "home#index"

 
  post '/user_friends/unfriend', to: "user_friend#unfriend"
  post '/user_friends/friend', to: "user_friend#friend"
  
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
end