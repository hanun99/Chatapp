Rails.application.routes.draw do
  mount ActionCable::Engine, at: '/cable'
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms
   # devise_for :users
    # This would define routes for index, show, create, etc.
  
    root controller: :rooms, action: :index
    resources :messages, only: [:index, :create]

  
  
    
  end
  