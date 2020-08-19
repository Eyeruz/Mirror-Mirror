Rails.application.routes.draw do
  resources :items, only: [:new, :create, :index, :show]
  
  resources :customeritems
  
  resources :categories_items
  
  resources :categories do 
    resources :items, only: [:edit, :update, :destroy]
  end 
  resources :customer_items

  resources :customers

  root 'categories#index'

get '/logout', to: 'sessions#destroy'
get '/signup', to: 'customers#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/edit', to: 'items#edit'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
