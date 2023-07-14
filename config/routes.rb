Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'users/new'
  get 'users/create'
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories, only: [:index, :new, :create]
  end

  root to: 'products#index'

  get '/about', to: 'about#index', as: 'about'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post :add_item
    post :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
  end
end
