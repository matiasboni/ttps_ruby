Rails.application.routes.draw do
  resources :turns
  root 'pages#home'
  devise_for :users , :controllers => {registrations: 'users/registrations'}
  resources :subsidiaries

  resources :users , only: [:index, :show , :new , :destroy]

  post 'users/create/' ,to: "users#create" , as:"create_user"
  get 'users/edit/:id' ,to: "users#edit" ,as: "edit_user"
  patch 'users/update/:id' , to: "users#update" ,as: "update_user"
  get 'turns_staff', to:"turns#index_staff" , as:"index_turns"
  get 'turns/attend_turn/:id',to:"turns#attend",as: "attend_turn"
  patch 'turns/confirm_attend/:id',to:"turns#confirm_attend", as: "confirm_attend_turn"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
