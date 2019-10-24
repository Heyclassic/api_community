Rails.application.routes.draw do
  resources :users
  resources :products do
    resources :comments
  end

  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  post 'signup', to: 'registrations#create'
  root 'products#index'
end
