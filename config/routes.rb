Rails.application.routes.draw do

  devise_for :users

  resources :users, only: :show
  resources :events, only: [:new, :create, :show] do
    resources :participants, only: [:create]
  end
  resources :participants, only: [:destroy]
  resources :games, only: [:show]
  get 'games/search', to: 'games#search'
  resources :libraries, only: [:index, :create, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
