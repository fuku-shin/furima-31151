Rails.application.routes.draw do
  get 'addresses/index'
  get 'sales/index'
  devise_for :users
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
end
