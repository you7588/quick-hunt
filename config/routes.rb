Rails.application.routes.draw do
  devise_for :users

  # jobs
  resources :jobs do
    resources :resumes
  end

  # admin
  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end

      resources :resumes

    end
  end

  # landing page
  resources :welcome do

  end

  root 'welcome#index'

end
