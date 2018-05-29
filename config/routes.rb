Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users do
    resources :items, only: [:create]
  end
  resources :items do
   resources :exchanges, only: [:create ]
   end
  end
  resources :exchanges, only: [:index]
  end
end
