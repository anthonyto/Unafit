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
      get 'edit_subscriptions'
      patch 'edit_subscriptions', to: 'users#update_subscriptions'
    end
    resources :client_profiles
    resources :gyms
    resources :charges
  end
  

end
