Rails.application.routes.draw do
  # root 'gyms#index'
  root 'welcome#index'

  resources :gyms do
    member do 
      get 'new_manager'
      post 'new_manager', to: 'gyms#create_manager'
    end
    resources :users, only: [:index, :show]
  end

  # devise_for :users 
  devise_for :users
  
  resources :users do 
    resources :client_profiles
    # resources :client_profiles, only: [:new]
    resources :gyms
  end

end
