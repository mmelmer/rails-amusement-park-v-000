Rails.application.routes.draw do

  root 'users#home'

  resources :users
  resources :attractions
  post '/users/:id', to: 'users#show'
  
  get 'signin', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  get 'sessions/destroy'
  post 'sessions/destroy'

  post 'rides/new'

end