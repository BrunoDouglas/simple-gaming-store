Rails.application.routes.draw do
  get 'platforms/index'
  get 'platforms/show'
  get 'games/show'
  get '/about', to: "pages#about"
  get '/contact', to: "pages#contact"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :games, only: [:show]
  resources :platforms, only: [:index, :show]

  root 'pages#main'
end
