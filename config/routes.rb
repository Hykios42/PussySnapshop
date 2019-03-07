Rails.application.routes.draw do
 
  devise_for :users
  root to: 'items#index'
  
  resources  :items, only: [:index, :show] do
    resources :cart_item
  end
  resources  :users, only: [:show]
  
end
