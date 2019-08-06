Rails.application.routes.draw do
  devise_for :users
  resources :matches
  resources :profiles, only: [:show]
  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  resources :pages, only: [:index]
  root to: 'pages#home'
end
