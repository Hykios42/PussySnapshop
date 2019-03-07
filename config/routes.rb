Rails.application.routes.draw do
 
  get 'order/index'
  get 'order/new'
  get 'order/create'
  devise_for :users
  root to: 'items#index'
  
  resources  :items, only: [:index, :show] do
    resources :cart_items
  end
  resources  :users, only: [:show]
  
end
