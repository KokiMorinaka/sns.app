Rails.application.routes.draw do
  get 'home/top'
  root 'home#top'
  #  新規ユーザー登録
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  
  #delete '/sessions/:id', to: 'sessions#destroy', as: :session
  get '/home/styles.css', to: 'home#styles', format: :css

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new]
  resources :sessions, only: [:new, :create, :destroy]

end

