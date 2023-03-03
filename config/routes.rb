Rails.application.routes.draw do
  resources :user, :friendships, only: [:new, :create, :destroy]
  devise_for :users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end
  root 'welcome#index'

  get "/users/:id", to: "user#index"
end
