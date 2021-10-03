Rails.application.routes.draw do
  resources :announcements
  resources :videos
  root 'home#index'
  get 'home/index'
  get '/Announcements', to: 'announcements#index' 
  resources :announcements do
    collection do
      get 'announcements'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
