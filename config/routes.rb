Rails.application.routes.draw do
  get 'notes/index'
  devise_for :users

  resources :home, only: :index
  resources :notes

  authenticated :user do
    root 'notes#index', as: 'authenticated_root'
  end

  root 'home#index'
end
