Rails.application.routes.draw do
  get 'participant/index'
  get 'participant/create'
  get 'participant/new'
  get 'participant/destroy'
  get 'library/index'
  get 'library/delete'
  get 'library/create'
  get 'games/show'
  get 'games/new'
  get 'games/create'
  get 'event/new'
  get 'event/create'
  get 'event/show'
  get 'event/destroy'
  get 'user/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
