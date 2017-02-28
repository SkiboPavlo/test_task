Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  resources :projects do
    resources :task_lists do
      resources :tasks do
        resources :tags
      end
    end
  end
end
