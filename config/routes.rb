Rails.application.routes.draw do
  
  root "home#index"

  post '/cart/update', to:'cart#update_quantity'
  post "payments/checkout",to:"payments#checkout"
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users
  resources :homes
  resources :products
  resources :users
  resources :orderitems
  resources :cart
  resources :payments
end
