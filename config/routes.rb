Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"
  
  resources :group_activities
  resources :groups do
    resources :activities
  end
end
