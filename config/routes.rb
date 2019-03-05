Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user

  resources :settings, only: [:index]
  resources :calendars, only: [:index, :show] # RJ added index here when trying to integrate calendar into app.
  resources :records, only: [:index, :show]
  resources :goals, only: [:index, :show]
  resources :tasks, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get :map
      get :intake
    end
  end
  root to: 'goals#index' # Will change this to login page later.
end
