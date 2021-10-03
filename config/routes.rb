Rails.application.routes.draw do
  resources :announcements
  resources :videos
  root 'home#index'
  get 'home/index'
  get 'videos/index'
  get 'Caldendar.html'
  get '/Announcements', to: 'announcements#index'
  resources :affiliate_orgs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
