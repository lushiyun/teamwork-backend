Rails.application.routes.draw do
  resources :messages
  get 'chats/show'
  resources :memberships
  resources :users
  resources :teams
  mount ActionCable.server => '/cable'
end
