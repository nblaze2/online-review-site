Rails.application.routes.draw do
  resources :movies do
    resources :reviews do
      post 'upvote'
      post 'downvote'
    end
  end

  # namespace :api do
  #   resources :reviews, only: [:upvote, :downvote] do
  #     post 'upvote'
  #     post 'downvote'
  #   end
  # end
  resources :reviews, only: [:edit, :destroy]
  resources :users, only: [:index]
  devise_for :users
  get "/pages/:page" => "pages#show"
  root to: "home#index"
end
