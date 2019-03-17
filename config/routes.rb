Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user

  resources :settings, only: [:index]
  resources :calendars, only: [:index, :show] # RJ added index here when trying to integrate calendar into app.
  resources :records, only: [:index, :show]
  resources :notifications, only: [:create, :destroy]
  resources :goals, only: [:index, :show, :edit, :update]
  resources :clients, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  resources :tasks, only: [:index, :show, :edit, :update, :destroy, :new, :create] do
    collection do
      get :map
      get :intake
    end
  end
  root to: 'tasks#index' # Will change this to login page later.
end
