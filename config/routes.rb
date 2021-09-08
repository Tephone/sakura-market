Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root 'tops#show'
  resource :top, only: [:show]
  namespace :admins do
    resources :users, only: %i[index show edit update destroy]
    resources :products
  end
  namespace :users do
    resource :mypage, only: %i[show]
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index show new create destroy]
    resources :orders, only: %i[index new create]
  end
end
