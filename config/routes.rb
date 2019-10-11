Rails.application.routes.draw do
  resources :users
  resources :products do
    resources :comments
  end

  root 'products#index'
end
