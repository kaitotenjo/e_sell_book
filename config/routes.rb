Rails.application.routes.draw do

  root "home#index"
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  devise_for :users , controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
