Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'home/index'

  # This will be the landing page route
  root 'home#index'


  resources :projects do
    resources :tasks
  end

  get 'work_projects/index'

  resources :work_projects do
    resources :dev_tasks, only: [:index, :edit, :update]
  end

  get 'get_project_status/:id', to: 'home#get_project_status', as: 'get_project_status'

  devise_for :users

end
