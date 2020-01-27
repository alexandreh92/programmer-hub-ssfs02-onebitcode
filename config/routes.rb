# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  resources :likes, only: %i[create destroy]
  resources :comments, only: %i[create destroy edit update]
  resources :posts, only: %i[index show create destroy edit update]
  resources :follows, only: %i[create destroy]

  get '/profile/:id', to: 'users#show', as: 'user'
  get '/profile/:id/followings', to: 'users#followings', as: 'following'
  get '/profile/:id/followers', to: 'users#followers', as: 'followers'
  post '/users/search', to: 'users#search', as: :search
  get '/users/search', to: 'users#search'

  devise_for :users, controllers: { registrations: 'registrations' }
end
