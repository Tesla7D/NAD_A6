Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  get 'sessions/new'

  #resources :posts
  resources :users
  #resources :welcome
  resources :codeposts,    only: [:create, :destroy, :show]

  root 'static_pages#home'
  get 'users/new'
  get '/about',   to: 'static_pages#about'
  get '/home',   to: 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/allposts', to: 'codeposts#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
