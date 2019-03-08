Rails.application.routes.draw do

  devise_for :users
  root to: 'items#index'
  
  resources  :items, only: [:index, :show] do
    resources :cart_items, only: [:new, :create, :delete]
  end
  resources  :users do
    resources :cart, only: [:show]
  end

  resources :order, only: [:index, :new, :create]

end