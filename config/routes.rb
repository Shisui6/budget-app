Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"
  
  resources :group_activities
  resources :activities
  resources :groups
end
