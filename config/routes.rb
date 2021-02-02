Rails.application.routes.draw do
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'spots#index'

  devise_for :users
  resources :users, only: [:edit, :update]
  resources :tweets

end
