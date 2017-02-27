Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  resources :users
  resources :tasks
  resources :projects do
    resources :tags
    resources :task_lists
  end
end

# Rails.application.routes.draw do
#   root to: 'projects#index'
#   devise_for :users
#   resources :users do
#     resources :tasks
#     resources :projects do
#       resources :tags
#       resources :task_lists do
#         resources :tasks do
#           resources :tag
#         end
#       end
#     end
#   end
# end

# Rails.application.routes.draw do
#   root to: 'projects#index'
#   devise_for :users
#   resources :tags
#   resources :tasks
#   resources :users do
#     resources :projects do
#       resources :task_lists
#     end
#   end
# end

