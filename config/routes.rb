Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :settings, only: [:index]
  resources :calendars, only: [:index, :show] # RJ added index here when trying to integrate calendar into app.
  resources :goals, only: [:index, :show]
  resources :tasks, only: [:index, :show]
  resources :records, only: [:index, :show]

  root to: 'goals#index' # Will change this to login page later.
end
