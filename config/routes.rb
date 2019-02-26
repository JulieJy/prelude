Rails.application.routes.draw do

  devise_for :users

  resources :users, only: :show
  resources :games, only: [:new, :create, :show]
  resources :event, only: [:new, :create, :show]
  resources :participants, only: [:index, :new, :create, :destroy]
  resources :libraries, only: [:index, :create, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
