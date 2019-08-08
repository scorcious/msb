Rails.application.routes.draw do
  devise_for :users
  resources :matches do
    resources :forums, only: [:new, :create]
    resources :players, only: [:create]
  end
  resources :profiles, only: [:show, :index] do
    # get '/request', to: 'friends#request', as: :request
  end

  get '/request/:profile_id', to: 'buddies#request', as: :request

  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  resources :pages, only: [:index]
  # resources :friendships, only: [:index]

  root to: 'pages#home'
  get '/tagged', to: 'matches#index', as: :tagged
end
