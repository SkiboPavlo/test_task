Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  resources :projects, shallow: true do
    resources :tags
    resources :task_lists, shallow: true do
      resources :tasks
    end
  end
end
