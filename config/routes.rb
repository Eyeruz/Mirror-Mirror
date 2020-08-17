Rails.application.routes.draw do
  resources :items
  resources :customeritems
  resources :categories_items
  resources :categories do 
    resources :items 
  end 
  resources :customer_items

  resources :customers


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
