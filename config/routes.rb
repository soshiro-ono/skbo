Rails.application.routes.draw do
  root to: 'spots#index'

  devise_for :users
  resources :users, only: [:edit, :update]
  resources :tweets

end
