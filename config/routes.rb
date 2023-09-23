Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'

  get '/welcome', to: 'pages#welcome'

  resources :books, only: %i[index show] do
    resources :ratings, only: %i[new create]
    resources :bookings, only: %i[new create]
  end

  resources :lists, only: %i[index show new create destroy]

  resources :wishlists, only: %i[index new create destroy]

  resources :posts, only: %i[index show new create destroy] do
    resources :comments, only: %i[new create]
  end

  resources :likes, only: %i[new create]

  resources :users, only: [:show] do
    collection do
      get :super_booksie
    end
  end

  resources :friendships, only: %i[create index destroy] do
    collection do
      get :followers
    end

    collection do
      get :followings
    end
  end

  resources :comments, only: %i[destroy edit update]
end
