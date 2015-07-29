Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  namespace :admin do
    resources :meats
    resources :side_dishes
  end

  resources :orders
end
