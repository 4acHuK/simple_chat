Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create] do
    get :friendship_action, on: :member
  end

  resources :user_sessions, only: [:create, :destroy]

  get 'chat/:partner_id', to: 'rooms#show', as: :chat

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  root to: 'user_sessions#new'

  mount ActionCable.server => '/cable'
end
