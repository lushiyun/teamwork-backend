Rails.application.routes.draw do
  get '/messages/:user_id', to: 'messages#index'
  get '/memberships/:user_id', to: 'memberships#index'
  get '/teams/:id/:datetime', to: 'teams#show'
  resources :teams, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create]
  resources :memberships
  resources :messages
  mount ActionCable.server => '/cable'
end
