Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [ :show ]
    resources :projects, only: [ :new, :create, :edit, :update, :destroy ]
    resources :images, only: [ :create, :destroy ]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :projects, only: [ :index ] do
    member do
      get :intro
      get :eval
      get :result
      post :average
    end
  end
  resources :scores, only: [ :create ]

  root to: 'projects#index'
end
