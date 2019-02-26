Rails.application.routes.draw do
  devise_for :users

  resources :goals, only: [:index, :show]
  resources :tasks, only: [:index, :show]

  root to: 'tasks#index' # Will change this to login page later.
end
