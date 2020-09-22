Rails.application.routes.draw do
  resources :teams, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create]
  resources :memberships
  resources :messages

  get '/messages/:user_id', to: 'messages#index'
  get '/memberships/:user_id', to: 'memberships#index'
  mount ActionCable.server => '/cable'
end
