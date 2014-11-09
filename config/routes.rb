Rails.application.routes.draw do

  root :to => 'main_page#index'

  resources :users

end
