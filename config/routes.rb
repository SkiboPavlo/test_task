Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  resources :projects, shallow: true do
    resources :task_lists, shallow: true do
      resources :tasks, shallow: true do
        resources :tags
      end
    end
  end
end
