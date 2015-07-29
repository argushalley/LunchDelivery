Rails.application.routes.draw do
  devise_for :users
  resources :meats
  resources :side_dishes
  resources :orders
end
