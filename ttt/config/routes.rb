Rails.application.routes.draw do
 resources :games
 resources :ttts
 root to: 'home#welcome'
end
