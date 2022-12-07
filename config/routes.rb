Rails.application.routes.draw do
  namespace :admins do
    resources :users
    resources :products
    get 'dashboard', to:"dashboard#index"
  end
  
  root "home#index"

  post '/cart/update', to:'cart#update_quantity'
  post "payments/checkout",to:"payments#checkout"
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users, controllers: { 
    sessions: "users/sessions" 
  }
  resources :homes
  resources :products
  resources :users
  resources :orderitems
  resources :cart
  resources :payments
end
