Rails.application.routes.draw do
  resources :turns
  root 'pages#home'
  devise_for :users
  resources :subsidiaries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
