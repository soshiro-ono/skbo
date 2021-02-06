Rails.application.routes.draw do
  get 'messages/index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'spots#index'
  resources :rooms do
    resources :messages, only: :create
  end

  devise_for :users
  resources :users
  resources :spots

end
