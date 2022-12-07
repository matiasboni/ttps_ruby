Rails.application.routes.draw do
  resources :turns
  root 'pages#home'
  devise_for :users
  resources :subsidiaries
  match '/users' , to: 'users#index' , via: 'get'
  get '/users/:id' ,to: 'users#show' ,as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
