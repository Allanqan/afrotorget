Rails.application.routes.draw do
  resources :ratings
  resources :adverts
  resources :blogs
  resources :bookmarks
  resources :products
  resources :product_categories
  resources :companies
  resources :company_types
  resources :user_categories
  devise_for :users
  resources :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
