Rails.application.routes.draw do
  get 'home/top'
  delete '/sessions/destroy', to: 'sessions#destroy', as: 'destroy_session'

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  resources :sessions, only: [:new, :create]

end

