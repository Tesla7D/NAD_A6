Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :welcome

  root 'posts#index'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
