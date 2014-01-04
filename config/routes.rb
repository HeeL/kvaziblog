Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  root 'posts#index'

  resources :posts

  ActiveAdmin.routes(self)

end
