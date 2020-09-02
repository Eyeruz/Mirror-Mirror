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
post '/signup', to: 'customers#create'
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
post '/edit', to: 'items#edit'
post '/delete', to: 'customer_items#destroy'
get '/checkout', to: 'customer_items#checkout'
get '/auth/facebook/callback' => 'sessions#facebook'

get '/userinfo', to: 'sessions#userinfo'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
