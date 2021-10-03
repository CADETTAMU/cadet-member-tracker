Rails.application.routes.draw do
  resources :announcements
  resources :videos
  root 'home#index'
  get 'home/index'
  get '/Videos', to: 'videos#index'
  get '/Calendar', to: 'home#calendar'
  get '/Announcements', to: 'announcements#index'
  get '/Home', to: 'home#index'
  resources :affiliate_orgs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
