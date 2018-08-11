Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # This will be the landing page route
  root 'home#index'
end
