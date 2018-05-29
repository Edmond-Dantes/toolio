Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users do
    resources :items, only: [:new, :create]
  end
  resources :items do
   resources :exchanges, only: [:create ]
  end
  resources :exchanges, only: [:index, :show]
end
