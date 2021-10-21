Rails.application.routes.draw do
  devise_for :members, controllers: {omniauth_callbacks: 'members/omniauth_callbacks'}
  devise_scope :member do
    get 'members/sign_in', to: 'members/sessions#new', as: :new_member_session
	get 'members/sign_out', to: 'sign_in#index', as: :destroy_member_session
  end

  resources :attendances
  resources :announcements
  resources :videos
  resources :affiliate_orgs
  root 'home#index'
  get 'home/index'
  get '/Videos', to: 'videos#index'
  get '/Calendar', to: 'home#calendar'
  get '/Announcements', to: 'announcements#index'
  get '/Attendances', to: 'attendances#index'
  get '/Home', to: 'home#index'
  get '/Sign_In', to: 'sign_in#index'
  get '/Links to Affiliate Orgs', to: 'affiliate_orgs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
