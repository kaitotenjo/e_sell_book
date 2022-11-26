Rails.application.routes.draw do
  resources :products
  
  root "home#index"
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users
  resources :homes
  resources :products
  resources :users
end
