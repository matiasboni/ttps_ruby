Rails.application.routes.draw do
  resources :turns
  root 'pages#home'
  devise_for :users
  resources :subsidiaries

  resources :users , only: [:index, :show , :new , :destroy]

  post 'users/create/' ,to: "users#create" , as:"create_user"
  get 'users/edit/:id' ,to: "users#edit" ,as: "edit_user"
  patch 'users/update/:id' , to: "users#update" ,as: "update_user"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
