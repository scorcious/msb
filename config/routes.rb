Rails.application.routes.draw do
  devise_for :users
  resources :matches
  resources :profiles, only: [:show]
  resources :categories, only: [:new, :create, :edit, :update ]
  root to: 'pages#home'
end
