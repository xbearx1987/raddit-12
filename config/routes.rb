Rails.application.routes.draw do
  devise_for :users
  root 'links#index'

  resources :links do
    resources :comments

    member do
      post :upvote
      post :downvote
    end
  end
end
