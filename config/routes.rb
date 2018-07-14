Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admins, shallow: true do
    resources :colors
  end
  resources :colors, only: [:index]
end
