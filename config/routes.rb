Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
