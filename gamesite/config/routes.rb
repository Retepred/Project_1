Rails.application.routes.draw do

  devise_for :users
  resources :games
  resources :move
  
  root to: 'home#welcome'

end
