Rails.application.routes.draw do
  devise_for :users
  root to: "nails#index"
  resources :nails
end
