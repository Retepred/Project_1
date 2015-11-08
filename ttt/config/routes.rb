Rails.application.routes.draw do
  
 resources :games
 resources :tttgames
 resources :move
 root to: 'home#welcome'

end
