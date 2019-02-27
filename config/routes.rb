Rails.application.routes.draw do

  devise_for :users

  resources :users, only: :show
  resources :events, only: [:new, :create, :show] do
    resources :participants, only: [:create]
  end
  resources :participants, only: [:destroy]
  get 'games/search', to: 'games#search'
  # get 'games/search/search_games', to: 'games#search_games'
  get 'games/suggestions', to: 'games#suggestions'
  resources :games, only: [:show]
  resources :libraries, only: [:index, :create, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
