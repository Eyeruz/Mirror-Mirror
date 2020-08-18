Rails.application.routes.draw do
  resources :items
  resources :customeritems
  resources :categories_items
  resources :categories do 
    resources :items 
  end 
  resources :customer_items

  resources :customers

  root 'categories#index'

get '/logout', to: 'sessions#destroy'
get '/signup', to: 'customers#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
