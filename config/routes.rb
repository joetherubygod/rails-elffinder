Rails.application.routes.draw do

  root to: 'users#index'

  resources :users, only: [:show, :index, :edit, :update, :new, :create]

  resources :messages, only: [:create]

  get 'login', to: 'session#new', as: 'login'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy', as: 'logout'

end
