Rails.application.routes.draw do
  match "/404", to: "errors#file_not_found", via: :all
  match "/422", to: "errors#unprocessable'", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  namespace :admins do
    get 'dashboard', to:"dashboard#index"
    resources :orders
    resources :order_items
    resources :users
    resources :products
  end
  
  root "home#index"
  post '/cart/update', to:'cart#update_quantity'
  post "payments/checkout",to:"payments#checkout"
  post "checkouts/checkout",to:"checkouts#checkout"
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
  resources :checkouts
end
