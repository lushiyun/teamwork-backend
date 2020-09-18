Rails.application.routes.draw do
  resources :messages
  resources :memberships
  resources :users
  resources :teams
  mount ActionCable.server => '/cable'
end
