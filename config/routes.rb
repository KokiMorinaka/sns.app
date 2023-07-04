Rails.application.routes.draw do
  get 'home/top'
  delete '/sessions/destroy', to: 'sessions#destroy', as: 'destroy_session'
  get '/sessions/styles.css', to: redirect('assets/styles.css')


  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  resources :sessions, only: [:new, :create]

end

