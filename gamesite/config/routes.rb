Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  get "/users", to: "users#index"
  resources :games
  resources :move
  
  root to: 'home#welcome'

end
