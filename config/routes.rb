Rails.application.routes.draw do

  get 'search',               to: 'search#index'
  get '/about',               to: 'pages#about'
  get '/contact',             to: 'pages#contact'
  get '/cart',                to: 'games#cart'
  get '/cart/update/:id',     to: 'games#updateCart'
  get '/cart/remove/:id',     to: 'games#removeCart'
  get '/games/:id/addToCart', to: 'games#addToCart'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :games, only: [:show]
  resources :platforms, only: [:index, :show]

  root 'pages#main'
end
