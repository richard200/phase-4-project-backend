Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :create, :destroy]
  resources :categories, only: [:index, :create, :show ]
  resources :recipes, only: [:index, :show, :create, :update, :destroy]
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  delete '/users/logout', to: 'users#logout'
  get '/user/login/check', to: 'users#check_login_status'

  get '/verify', to: 'application#verify_auth'

end
