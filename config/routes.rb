Rails.application.routes.draw do
  get 'dashboard/index'

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # This will be the landing page route
  root 'home#index'

  resources :projects do
    resources :tasks
  end

  devise_for :users
end
