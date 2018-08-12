Rails.application.routes.draw do
  get 'work_tasks/index'
  get 'work_tasks/edit'
  get 'work_tasks/update'
  get 'work_projects/index'
  get 'work_projects/show'
  get 'dashboard/index'

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # This will be the landing page route
  root 'home#index'

  resources :projects do
    resources :tasks
  end

  resources :work_projects, only: [:index] do
    resources :dev_tasks, only: [:index, :edit, :update]
  end

  devise_for :users
end
