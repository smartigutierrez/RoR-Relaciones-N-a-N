Rails.application.routes.draw do
resources :posts do
  resources :comments, only: [:create]
end

resources :likes, only: [:create, :destroy]
  root "home#index"
  
  get '/posts', to: 'posts#index', as: 'user_root'

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
