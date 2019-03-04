Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :goals, only: [:index, :show] do
    collection do
      get :intake
    end
  end

  resources :settings, only: [:index]
  resources :calendars, only: [:index, :show] # RJ added index here when trying to integrate calendar into app.
  resources :records, only: [:index, :show]
  resources :tasks, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get :map
    end
  end

  root to: 'goals#index' # Will change this to login page later.
end
