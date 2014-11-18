Rails.application.routes.draw do

  # /
  root :to => 'main_page#index'
  # /users/*
  resources :users, except: [:new]
  # login
  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  resources :sessions, only: [:create]

end
