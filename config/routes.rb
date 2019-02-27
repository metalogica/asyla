Rails.application.routes.draw do
  devise_for :users
  resources :calendars, only: [:show]
  resources :goals, only: [:index, :show]
  resources :tasks, only: [:index, :show]
  resources :records, only: [:index, :show]

  root to: 'tasks#index' # Will change this to login page later.
end
