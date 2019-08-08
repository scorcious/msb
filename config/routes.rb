Rails.application.routes.draw do
  devise_for :users
  resources :matches do
    resources :forums, only: [:new, :create]
    resources :players, only: [:create]
  end
<<<<<<< HEAD
  resources :profiles, only: [:show, :index] do
    # get '/request', to: 'friends#request', as: :request
  end

  get '/request/:profile_id', to: 'buddies#request', as: :request

=======
>>>>>>> origin
  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  resources :pages, only: [:index]
  # resources :friendships, only: [:index]

  root to: 'pages#home'
  get '/tagged', to: 'matches#index', as: :tagged

  resources :profiles, only: [:index, :show]
  post '/profiles/:id', to: 'profiles#add_friend', as: :add_friend
end
