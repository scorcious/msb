Rails.application.routes.draw do
  devise_for :users
  resources :matches do
    resources :forums, only: [:new, :create]
  end
  resources :profiles, only: [:show]
  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  root to: 'pages#home'
end
