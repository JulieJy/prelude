Rails.application.routes.draw do
  # get 'participant/index'
  # get 'participant/create'
  # get 'participant/new'
  # get 'participant/destroy'
  # get 'library/index'
  # get 'library/delete'
  # get 'library/create'
  # get 'game/show'
  # get 'game/new'
  # get 'game/create'
  # get 'event/new'
  # get 'event/create'
  # get 'event/show'
  # get 'event/destroy'
  # get 'user/show'
  devise_for :users

  resources :users, only: :show
  resources :events, only: [:new, :create, :show] do
    resources :participants, only: [:create]
  end
  resources :participants, only: [:destroy]

  resources :games, only: [:show]
  resources :libraries, only: [:index, :create, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
