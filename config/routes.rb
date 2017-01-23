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

  devise_for :users
  root to: "home#index"
end
