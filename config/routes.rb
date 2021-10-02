Rails.application.routes.draw do
  resources :announcements
  resources :videos
  get 'home/index'
  resources :affiliate_orgs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
