Rails.application.routes.draw do
  resources :messages
  resources :memberships
  resources :users
  resources :teams
  get '/teams/:id/:datetime', to: 'teams#show'
  mount ActionCable.server => '/cable'
end
