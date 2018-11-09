Rails.application.routes.draw do

  get 'search',   to: 'search#index'
  get '/about',   to: 'pages#about'
  get '/contact', to: 'pages#contact'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :games, only: [:show]
  resources :platforms, only: [:index, :show]

  root 'pages#main'
end
