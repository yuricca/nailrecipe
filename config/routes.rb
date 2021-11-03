Rails.application.routes.draw do
  devise_for :users
  root to: "nails#index"
  resources :nails do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
end
