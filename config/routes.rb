Rails.application.routes.draw do
  devise_for :members, controllers: {omniauth_callbacks: 'members/omniauth_callbacks'}
  devise_scope :member do
    get 'members/sign_in', to: 'sign_in#index', as: :new_member_session
	get 'members/sign_out', to: 'sign_in#index', as: :destroy_member_session
  end
  
  resources :attendances
  resources :announcements
  resources :videos
  root 'home#index'
  get 'home/index'
  get '/Videos', to: 'videos#index'
  get '/Calendar', to: 'home#calendar'
  get '/Announcements', to: 'announcements#index'
  get '/Attendances', to: 'attendances#index'
  get '/Home', to: 'home#index'
  get '/Sign_In', to: 'sign_in#index'
  resources :affiliate_orgs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
