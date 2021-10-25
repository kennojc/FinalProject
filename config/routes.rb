Rails.application.routes.draw do
  get 'pages/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :auctions
  resources :products
  resources :types
  resources :artists
  resources :awards
  devise_for :users
  root 'pages#index'
  get '/user' => "auctions#index", :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
