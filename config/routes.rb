Rails.application.routes.draw do
  devise_for :users
  get 'exchanges/create'
  get 'items/index'
  get 'items/create'
  get 'items/show'
  get 'items/destroy'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
