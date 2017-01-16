Rails.application.routes.draw do
  resources :reviews
  resources :movies
  devise_for :users
  root to: "home#index"
end
