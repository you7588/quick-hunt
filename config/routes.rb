Rails.application.routes.draw do
  devise_for :users

  # jobs
  resources :jobs

  # admin
  namespace :admin do
    resources :jobs
  end

  root 'jobs#index'
end
