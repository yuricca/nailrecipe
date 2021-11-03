Rails.application.routes.draw do
  devise_for :users
  root to: "nails#index"
  resources :nails do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
