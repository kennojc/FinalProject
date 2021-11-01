Rails.application.routes.draw do
  get 'pages/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :auctions
  resources :products
  resources :types
  resources :artists
  resources :awards
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'pages#index'
  get '/user' => "auctions#index", :as => :user_root
  get '/payment' => "user_products#index", :as => :payment_root
  post :create_order, :to => 'user_products#create_order'
  post :capture_order, :to => 'user_products#capture_order'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
