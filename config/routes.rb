Rails.application.routes.draw do
  resources :auctions
  resources :products
  resources :types
  resources :artists
  resources :awards
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
