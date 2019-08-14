Rails.application.routes.draw do
  get 'rankings/index'
  devise_for :users
  resources :matches do
    # resources :forums, only: [:new, :create]
    resources :players, only: [:create]
    # API for forums
    resources :forums, only: [:new, :create], defaults: { format: :json }
    post 'winner', to: 'matches#winner', as: :winner
  end
  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  resources :pages, only: [:index]
  root to: 'pages#home'
  get '/tagged', to: 'matches#index', as: :tagged

  resources :profiles, only: [:index, :show]
  resources :players, only: [:index, :update, :create]
  post '/profiles/:id/add', to: 'profiles#add_friend', as: :add_friend
  post '/profiles/:id/accept', to: 'profiles#accept_friend', as: :accept_friend
  post '/profiles/:id/decline', to: 'profiles#decline_friend', as: :decline_friend
  get '/my_friends', to: 'profiles#my_friends', as: :my_friends

  resources :forums, only: [:index], defaults: { format: :json }

  # API for Join Team - Felipe
  post 'players/join_team', to: 'players#join_team', as: :join_team

end
