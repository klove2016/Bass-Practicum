Rails.application.routes.draw do
  resources :hobbies
  resources :user, :friendships, only: [:new, :create, :destroy]
  devise_for :users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end
  root 'welcome#index'

  get "/users/:id", to: "user#index"
  get "/friendships", to: "friendships#show"
  get '/hobby/:id/like', to: 'hobbies#like', as: 'like'
end
