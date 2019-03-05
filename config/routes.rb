Rails.application.routes.draw do
  get 'cart_items/create'
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html"
  
  resources  :items, only:  [:index, :show] do
    resources :cart_items, only: [:create] 
  end

end
