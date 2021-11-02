Rails.application.routes.draw do
  devise_for :users
  root to: "nails#index"
  resources :nails
  resources :users, only: [:show, :edit, :update]
end
