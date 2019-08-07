Rails.application.routes.draw do
  devise_for :users
  resources :matches do
    resources :forums, only: [:new, :create]
    resources :players, only: [:create]
  end
  resources :profiles, only: [:show]
  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  resources :pages, only: [:index]
  root to: 'pages#home'
  get '/tagged', to: 'matches#index', as: :tagged
end
