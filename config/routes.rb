Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: :show
  resources :events, only: [:new, :create, :show] do
    resources :participants, only: [:create]
  end
  resources :participants, only: [] do
    member do
      patch "accept"
      patch "decline"
    end
  end
  resources :participants, only: [:destroy]
  get 'games/search', to: 'games#search'
  # get 'games/search/search_games', to: 'games#search_games'
  get 'games/suggestions', to: 'games#suggestions'
  resources :games, only: [:show, :new, :create]
  resources :libraries, only: [:index, :create, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
