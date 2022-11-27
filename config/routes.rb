Rails.application.routes.draw do
  root "home#index"

  post '/cart/update', to:'cart#update_quantity'
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users
  resources :homes
  resources :products
  resources :users
  resources :orderitems
  resources :cart
end
