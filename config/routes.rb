Rails.application.routes.draw do
  resources :users
  resources :products

  root 'products#index'
end
