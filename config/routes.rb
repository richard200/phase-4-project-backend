Rails.application.routes.draw do
  resources :reviews 
  resources :categories
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/verify', to: 'application#verify_auth'
end
