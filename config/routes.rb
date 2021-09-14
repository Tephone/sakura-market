Rails.application.routes.draw do
  devise_for :sellers, controllers: { sessions: 'sellers/sessions' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  root 'tops#show'
  resource :top, only: [:show]
  namespace :admins do
    resources :users, only: %i[index show edit update destroy]
    resources :products
    resources :coupons
    resources :sellers
    resources :orders, only: %i[index show edit update]
  end
  namespace :sellers do
    resources :sellers, only: %i[show edit update]
    resources :products
    resources :orders, only: %i[index show edit update]
  end
  namespace :users do
    resource :mypage, only: %i[show]
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index show new create destroy]
    resources :orders, only: %i[index new create]
    resources :diaries
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
    resources :coupons, only: %i[index]
    resource :my_coupon, only: [:show]
    resources :get_coupons, only: %i[new create]
    resources :consume_coupons, only: [:index]
  end
  resources :diaries, only: %i[index show]
end
