Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'

  get '/welcome', to: 'pages#welcome'
  resources :books, only: %i[index show]
  resources :posts, only: %i[index show] do
    resources :comments, only: %i[new create]
  end
  resources :users, only: [:show] do
    collection do
      get :super_booksie
    end
  end
end
