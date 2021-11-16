Rails.application.routes.draw do
  resources :meetings
  # For OAuth
  devise_for :members, controllers: {omniauth_callbacks: 'members/omniauth_callbacks'}
  devise_scope :member do
    get '/sign_in', to: 'sign_in#index', as: :new_member_session
	get '/sign_out', to: 'devise/sessions#destroy', as: :destroy_member_session
  end
  
  # For OAuth Testing
  post '/members/auth/google_oauth2'

  #root :to => 'home#index'

  resources :attendances
  resources :announcements
  resources :videos
  resources :affiliate_orgs
  resources :sign_in
  resources :member
  root 'home#index'
  get 'home/index'
  get '/Home', to: 'home#index'
  get '/Videos', to: 'videos#index'
  get '/Calendar', to: 'home#calendar'
  get '/Announcements', to: 'announcements#index'
  get '/Attendances', to: 'attendances#index'
  get '/Links to Affiliate Orgs', to: 'affiliate_orgs#index'
  get '/Sign_In', to: 'sign_in#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
