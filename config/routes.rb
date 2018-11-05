Rails.application.routes.draw do
  get 'about', to: "pages#about"
  get 'contact', to: "pages#contact"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #resources :students, only: [:index, :show]
end
