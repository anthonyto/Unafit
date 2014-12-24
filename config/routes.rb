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
    member do 
      get 'edit_registrations'
      patch 'edit_registrations', to: 'users#update_registrations'
    end
    resources :client_profiles
    resources :gyms
  end

end
