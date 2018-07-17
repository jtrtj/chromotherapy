Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :colors, only: [:new]
  end

  resources :admins do
    resources :colors
    resources :reactions
  end
  resources :colors do 
    resources :surveys
  end
  
  resources :colors, only: [:index, :show]
  resources :reactions, only: [:index, :show]
 
end
