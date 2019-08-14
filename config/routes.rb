Rails.application.routes.draw do
  # Pages
  root to: 'pages#home'
  resources :pages, only: [:index]
  
  # Users
  devise_for :users
  resources :profiles, only: [:index, :show]

  # Players
  resources :players, only: [:index, :update, :create]
  
  # Friends
  get '/my_friends', to: 'profiles#my_friends', as: :my_friends
  post '/profiles/:id/add', to: 'profiles#add_friend', as: :add_friend
  post '/profiles/:id/accept', to: 'profiles#accept_friend', as: :accept_friend
  post '/profiles/:id/decline', to: 'profiles#decline_friend', as: :decline_friend

  # Matches
  resources :matches do
    # Join match
    resources :players, only: [:create]

    # API for forums
    resources :forums, only: [:new, :create], defaults: { format: :json }
    post 'winner', to: 'matches#winner', as: :winner
  end
  get '/tagged', to: 'matches#index', as: :tagged

  # Categories
  resources :categories, only: [:new, :create, :edit, :update, :destroy ]
  
  # Forums
  resources :forums, only: [:index], defaults: { format: :json }

  # Rankings / Leaderboards
  get 'rankings', to: "rankings#index", as: :rankings
end
