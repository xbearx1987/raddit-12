Rails.application.routes.draw do
  devise_for :users
  root 'links#index'

  resources :links do
    member do
      post :upvote
      post :downvote
    end
  end
end
