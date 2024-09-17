# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'carts/show'
  resources :products
  namespace :admin do
    resources :users
    resources :roles, only: %i[index show]
    resources :users, except: [:new]

    # root to: 'users#index'
    get '/products/card/id',to: 'products#card'
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  # Defines the root path route ("/")


get 'carts/:id' => "carts#show", as: "cart"
delete 'carts/:id' => "carts#destroy"

get 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
get 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
post 'line_items' => "line_items#create"
get 'line_items/:id' => "line_items#show", as: "line_item"
delete 'line_items/:id' => "line_items#destroy"
resources :orders


  # root "articles#index"
end
