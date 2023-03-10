Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  get '/welcome', to: 'pages#welcome'
  resources :books

  resources :users, only: :show
  resources :posts
end
