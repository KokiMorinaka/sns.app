Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root to: "users#index", as: :authenticated_root
  end

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end

