Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :users , controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  root 'tops#show'
  resource :top, only: [:show]
  namespace :admins do
    resources :products
  end
  namespace :users do
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index show new create destroy]
  end
end
