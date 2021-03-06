Rails.application.routes.draw do
  devise_for :users
  root to:'prototypes#index' 
  resources :prototypes do
    resources :prototypes,only:[:new,:create,:show,:edit,:update,:destroy]
    resources :comments,only: :create
  end
  resources :users, only: :show
end
